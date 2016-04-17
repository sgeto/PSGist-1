#
# Module manifest for module 'PSGist'
#
# Generated by: Thomas J. Malkewitz @dotps1
#
# Generated on: 4/10/2016
#

@{

# Script module or binary module file associated with this manifest.
RootModule = '.\PSGist.psm1'

# Version number of this module.
ModuleVersion = '1.2.0'

# ID used to uniquely identify this module
GUID = '04216bc2-e539-486f-871a-46c72a9ff017'

# Author of this module
Author = 'Thomas J. Malkewitz @dotps1'

# Company or vendor of this module
# CompanyName = 'Unknown'

# Copyright statement for this module
Copyright = '(c) 2016 Thomas J. Malkewitz @dotps1. All rights reserved.'

# Description of the functionality provided by this module
Description = 'A module to interface with Gist objects using the GitHub API.'

# Minimum version of the Windows PowerShell engine required by this module
# PowerShellVersion = ''

# Name of the Windows PowerShell host required by this module
# PowerShellHostName = ''

# Minimum version of the Windows PowerShell host required by this module
# PowerShellHostVersion = ''

# Minimum version of Microsoft .NET Framework required by this module
# DotNetFrameworkVersion = ''

# Minimum version of the common language runtime (CLR) required by this module
# CLRVersion = ''

# Processor architecture (None, X86, Amd64) required by this module
# ProcessorArchitecture = ''

# Modules that must be imported into the global environment prior to importing this module
# RequiredModules = @()

# Assemblies that must be loaded prior to importing this module
# RequiredAssemblies = @()

# Script files (.ps1) that are run in the caller's environment prior to importing this module.
# ScriptsToProcess = @()

# Type files (.ps1xml) to be loaded when importing this module
# TypesToProcess = @()

# Format files (.ps1xml) to be loaded when importing this module
FormatsToProcess = @(
    '.\PSGist.formats.ps1xml'
)

# Modules to import as nested modules of the module specified in RootModule/ModuleToProcess
# NestedModules = @()

# Functions to export from this module
FunctionsToExport = 'Add-GistFile',
    'Copy-Gist',
    'Get-Gist',
    'Get-GistCommit',
    'Get-GistFork',
    'New-Gist',
    'New-GistOAuthToken',
    'Remove-Gist',
    'Remove-GistFile',
    'Rename-GistFile',
    'Save-Gist',
    'Set-Gist',
    'Set-GistOAuthToken',
    'Update-GistFile'

# Cmdlets to export from this module
# CmdletsToExport = '*'

# Variables to export from this module
# VariablesToExport = '*'

# Aliases to export from this module
# AliasesToExport = '*'

# DSC resources to export from this module
# DscResourcesToExport = @()

# List of all modules packaged with this module
# ModuleList = @()

# List of all files packaged with this module
FileList = @(
    'en-US'
    'Private'
    'Private\Invoke-GistApi.ps1'
    'Private\PSGist.Classes.ps1'
    'Public'
    'Public\Add-GistFile.ps1'
    'Public\Copy-Gist.ps1'
    'Public\Get-Gist.ps1'
    'Public\Get-GistCommit.ps1'
    'Public\Get-GistFork.ps1'
    'Public\New-Gist.ps1'
    'Public\New-GistOAuthToken.ps1'
    'Public\Remove-Gist.ps1'
    'Public\Remove-GistFile.ps1'
    'Public\Rename-GistFile.ps1'
    'Public\Save-Gist.ps1'
    'Public\Set-Gist.ps1'
    'Public\Set-GistOAuthToken.ps1',
    'Public\Update-GistFile.ps1'
    'PSGist.formats.ps1xml'
    'PSGist.psd1'
    'PSGist.psm1'
)

# Private data to pass to the module specified in RootModule/ModuleToProcess. This may also contain a PSData hashtable with additional module metadata used by PowerShell.
PrivateData = @{

    PSData = @{

        # Tags applied to this module. These help with module discovery in online galleries.
        # Tags = @()

        # A URL to the license for this module.
        # LicenseUri = ''

        # A URL to the main website for this project.
        ProjectUri = 'https://github.com/dotps1/PSGist'

        # A URL to an icon representing this module.
        # IconUri = ''

        # ReleaseNotes of this module
        # ReleaseNotes = ''

    } # End of PSData hashtable

} # End of PrivateData hashtable

# HelpInfo URI of this module
# HelpInfoURI = ''

# Default prefix for commands exported from this module. Override the default prefix using Import-Module -Prefix.
# DefaultCommandPrefix = ''

}
