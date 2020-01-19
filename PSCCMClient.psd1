#
# Module manifest for module 'PSCCMClient'
#
# Generated by: Cody Mathis
#
# Generated on: 9/29/2019
#

@{

    # Script module or binary module file associated with this manifest.
    RootModule        = 'PSCCMClient.psm1'

    # Version number of this module.
    ModuleVersion     = '0.1.2'

    # Supported PSEditions
    # CompatiblePSEditions = @()

    # ID used to uniquely identify this module
    GUID              = '103faf7f-4612-49ac-85be-2a5196654c68'

    # Author of this module
    Author            = 'Cody Mathis'

    # Company or vendor of this module
    CompanyName       = 'PSCCMClient'

    # Copyright statement for this module
    Copyright         = '(c) 2020 Cody Mathis. All rights reserved.'

    # Description of the functionality provided by this module
    Description       = 'Module focused on interacting with and managing the MEMCM Client'

    # Minimum version of the Windows PowerShell engine required by this module
    # PowerShellVersion = ''

    # Name of the Windows PowerShell host required by this module
    # PowerShellHostName = ''

    # Minimum version of the Windows PowerShell host required by this module
    # PowerShellHostVersion = ''

    # Minimum version of Microsoft .NET Framework required by this module. This prerequisite is valid for the PowerShell Desktop edition only.
    # DotNetFrameworkVersion = ''

    # Minimum version of the common language runtime (CLR) required by this module. This prerequisite is valid for the PowerShell Desktop edition only.
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
    # FormatsToProcess = @()

    # Modules to import as nested modules of the module specified in RootModule/ModuleToProcess
    # NestedModules = @()

    # Functions to export from this module, for best performance, do not use wildcards and do not delete the entry, use an empty array if there are no functions to export.
    FunctionsToExport = @('ConvertFromCCMSchedule',
        'Get-CCMBaseline',
        'Get-CCMCacheInfo',
        'Get-CCMCacheContent',
        'Get-CCMClientDirectory',
        'Get-CCMCurrentManagementPoint',
        'Get-CCMCurrentSoftwareUpdatePoint',
        'Get-CCMDNSSuffix',
        'Get-CCMGUID',
        'Get-CCMLastHardwareInventory',
        'Get-CCMLastHeartbeat',
        'Get-CCMLastScheduleTrigger',
        'Get-CCMLastSoftwareInventory',
        'Get-CCMLogFile',
        'Get-CCMLoggingConfiguration',
        'Get-CCMMaintenanceWindow',
        'Get-CCMPackage',
        'Get-CCMPrimaryUser',
        'Get-CCMProvisioningMode',
        'Get-CCMServiceWindow',
        'Get-CCMTaskSequence',
        'Get-CCMUpdate',
        'Invoke-CCMBaseline',
        'Invoke-CCMClientAction',
        'Invoke-CCMPackage',
        'Invoke-CCMResetPolicy',
        'Invoke-CCMTriggerSchedule',
        'Invoke-CCMUpdate',
        'Invoke-CIMPowerShell',
        'Invoke-CCMTaskSequence',
        'Remove-CCMCacheContent',
        'Repair-CCMCacheLocation',
        'Reset-CCMLoggingConfiguration',
        'Set-CCMCacheLocation',
        'Set-CCMCacheSize',
        'Set-CCMDNSSuffix',
        'Set-CCMLoggingConfiguration',
        'Set-CCMManagementPoint',
        'Set-CCMProvisioningMode',
        'Write-CCMLogEntry'
    )

    # Cmdlets to export from this module, for best performance, do not use wildcards and do not delete the entry, use an empty array if there are no cmdlets to export.
    CmdletsToExport   = @()

    # Variables to export from this module
    VariablesToExport = '*'

    # Aliases to export from this module, for best performance, do not use wildcards and do not delete the entry, use an empty array if there are no aliases to export.
    AliasesToExport   = @('Get-CCMLastDDR',
        'Get-CCMCurrentMP',
        'Get-CCMCurrentSUP',
        'Get-CCMLastHINV',
        'Get-CCMLastSINV'
        'Get-CCMMP',
        'Get-CCMMW',
        'Get-CCMSUP',
        'Set-CCMMP'
    )

    # DSC resources to export from this module
    # DscResourcesToExport = @()

    # List of all modules packaged with this module
    # ModuleList = @()

    # List of all files packaged with this module
    # FileList = @()

    # Private data to pass to the module specified in RootModule/ModuleToProcess. This may also contain a PSData hashtable with additional module metadata used by PowerShell.
    PrivateData       = @{

        PSData = @{

            # Tags applied to this module. These help with module discovery in online galleries.
            Tags         = @('SCCM', 'MEMCM', 'CIM', 'ConfigMgr', 'PowerShell', 'System Center')

            # A URL to the license for this module.
            # LicenseUri = ''

            # A URL to the main website for this project.
            ProjectUri   = 'https://github.com/CodyMathis123/PSCCMClient'

            # A URL to an icon representing this module.
            # IconUri = ''

            # ReleaseNotes of this module
            ReleaseNotes = @'
v0.1.3
* Rename Get-CCMSoftwareUpdatePoint.ps1 file to Get-CCMCurrentSoftwareUpdatePoint.ps1 to match function name
* Add Get-CCMDNSSuffix to module
* Add Get-CCMGUID to module
* Add Set-CCMDNSSuffix to module
* Add Set-CCMManagementPoint to module
* Adding some aliases for MP/SUP/DDR commands
* Add -whatif support to some functions that should have already had it implemented
v0.1.2
* Adding release notes to manifest
v0.1.1
* Update Get-CCMUpdate to translate ComplianceState and EvaluationState
v0.1.0
* Initial publish to PowerShell Gallery
'@

        } # End of PSData hashtable

    } # End of PrivateData hashtable

    # HelpInfo URI of this module
    # HelpInfoURI = ''

    # Default prefix for commands exported from this module. Override the default prefix using Import-Module -Prefix.
    # DefaultCommandPrefix = ''

}
