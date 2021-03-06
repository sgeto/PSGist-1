Function Update-GistFile {
    [CmdletBinding(
        ConfirmImpact = "Medium", 
        HelpUri = "http://dotps1.github.io/PSGist/Update-GistFile.html",
        SupportsShouldProcess = $true
    )]
    [OutputType(
        [Gist]
    )]

    Param (
        [Parameter(
            HelpMessage = "The Id of the Gist Object.",
            Mandatory = $true, 
            ValueFromPipelineByPropertyName = $true
        )]
        [String]
        $Id,

        [Parameter(
            HelpMessage = "Path to file(s) where the content will be used for the GistFile.",
            Mandatory = $true,
            ParameterSetName = "Path",
            ValueFromPipelineByPropertyName = $true
        )]
        [ValidateScript({ 
            if (Test-Path -Path $_) { 
                $true 
            } else { 
                throw "Cannot find path: '$_' because it does not exist." 
            }
        })]
        [ValidateScript({ 
            if (-not (Get-Item -Path $_).PSIsContainer) { 
                $true 
            } else { 
                throw "Path must be to a file." 
            }
        })]
        [Alias(
            'FullName'
        )]
        [String[]]
        $Path
    )

    DynamicParam {
        # Only present this parameter set if running the PowerShell ISE.
        if ($null -ne $psISE) {
            # Build Attributes for the IseScriptPane Parameter.
            $iseScriptPaneAttributes = New-Object -TypeName System.Management.Automation.ParameterAttribute -Property @{
                HelpMessage = "Captures the current active ISE Script Pane for the GistFile content."
                ParameterSetName = "IseScriptPane"
            }
            # Build Collection Object to hold Parameter Attributes.
            $iseScriptPaneCollection = New-Object -TypeName System.Collections.ObjectModel.Collection[System.Attribute]
            $iseScriptPaneCollection.Add($iseScriptPaneAttributes)
            # Build Runtime Parameter with Collection Parameter Attributes.
            $iseScriptPaneParameter = New-Object -TypeName System.Management.Automation.RuntimeDefinedParameter  -ArgumentList ("IseScriptPane", [Switch], $iseScriptPaneCollection)

            # Build Attributes for GistFileName Parameter.
            $gistFileNameAttributes = New-Object -TypeName System.Management.Automation.ParameterAttribute -Property @{
                HelpMessage = "The name of the Gist file."
                ParameterSetName = "IseScriptPane"
            }
            # Build Collection Object to hold Parameter Attributes. 
            $gistFileNameCollection = New-Object -TypeName System.Collections.ObjectModel.Collection[System.Attribute]
            $gistFileNameCollection.Add($gistFileNameAttributes)
            # Build Runtime Parameter with Collection Parameter Attributes.
            $gistFileNameParameter = New-Object -TypeName System.Management.Automation.RuntimeDefinedParameter -ArgumentList ("FileName", [String], $gistFileNameCollection)
            
            # Build Runtime Dictionary and add Runtime Parameters to it.
            $dictionary = New-Object -TypeName System.Management.Automation.RuntimeDefinedParameterDictionary
            $dictionary.Add("IseScriptPane", $iseScriptPaneParameter)
            $dictionary.Add("FileName", $gistFileNameParameter)
            # Return dictionary of Runtime Paramters to the PSCmdlet.
            return $dictionary
        }
    }
    
    Process {
        [HashTable]$body = @{
            files = @{}
        }

        if ($PSCmdlet.ParameterSetName -ne "IseScriptPane") {
            $body.files.Add(
                $(Split-Path -Path $Path -Leaf), @{ 
                    content = ((Get-Content -Path $Path -Raw).PSObject.BaseObject) 
                }
            )
        } else {
            if ([String]::IsNullOrEmpty($PSBoundParameters.FileName)) {
                $PSBoundParameters.FileName = $psISE.CurrentPowerShellTab.Files.SelectedFile.DisplayName.TrimEnd("*")
            }

            $body.files.Add(
                $PSBoundParameters.FileName, @{ 
                    content = $psISE.CurrentPowerShellTab.Files.SelectedFile.Editor.Text 
                }
            )
        }

        if ($PSCmdlet.ShouldProcess($Id)) {
            $apiCall = @{
                Body = ConvertTo-Json -InputObject $body -Compress
                RestMethod = "gists/{0}" -f $Id
                Method = "PATCH"
            }
        
            [Gist]::new(
                (Invoke-GistApi @apiCall)
            )
        }
    }
}
