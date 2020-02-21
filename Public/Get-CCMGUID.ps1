# TODO - Update help
function Get-CCMGUID {
    <#
    .SYNOPSIS
        Returns the current client GUID
    .DESCRIPTION
        This function will return the current GUID for the MEMCM client using CIM.
    .PARAMETER CimSession
        Provides CimSessions to gather the GUID from
    .PARAMETER ComputerName
        Provides computer names to gather the GUID from
    .EXAMPLE
        C:\PS> Get-CCMGUID
            Returns the GUID from local computer
    .EXAMPLE
        C:\PS> Get-CCMGUID -ComputerName 'Workstation1234','Workstation4321'
            Returns the GUID from Workstation1234, and Workstation4321
    .NOTES
        FileName:    Get-CCMGUID.ps1
        Author:      Cody Mathis
        Contact:     @CodyMathis123
        Created:     2020-01-18
        Updated:     2020-02-19
    #>
    [CmdletBinding(DefaultParameterSetName = 'ComputerName')]
    param (
        [Parameter(Mandatory = $false, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'CimSession')]
        [Microsoft.Management.Infrastructure.CimSession[]]$CimSession,
        [Parameter(Mandatory = $false, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'ComputerName')]
        [Alias('Connection', 'PSComputerName', 'PSConnectionName', 'IPAddress', 'ServerName', 'HostName', 'DNSHostName')]
        [string[]]$ComputerName = $env:ComputerName,
        [Parameter(Mandatory = $false, ParameterSetName = 'PSSession')]
        [System.Management.Automation.Runspaces.PSSession[]]$PSSession,
        [Parameter(Mandatory = $false, ParameterSetName = 'ComputerName')]
        [ValidateSet('CimSession', 'PSSession')]
        [string]$ConnectionPreference
    )
    begin {
        $getGUIDSplat = @{
            Namespace = 'root\CCM'
            Query     = 'SELECT ClientID, ClientIDChangeDate, PreviousClientID FROM CCM_Client'
        }
    }
    process {
        foreach ($Connection in (Get-Variable -Name $PSCmdlet.ParameterSetName -ValueOnly)) {
            $getConnectionInfoSplat = @{
                $PSCmdlet.ParameterSetName = $Connection
            }
            switch ($PSBoundParameters.ContainsKey('ConnectionPreference')) {
                $true {
                    $getConnectionInfoSplat['Prefer'] = $ConnectionPreference
                }
            }
            $ConnectionInfo = Get-CCMConnection @getConnectionInfoSplat
            $Computer = $ConnectionInfo.ComputerName
            $connectionSplat = $ConnectionInfo.connectionSplat

            $Result = [ordered]@{ }
            $Result['ComputerName'] = $Computer

            try {
                [ciminstance[]]$CurrentGUID = switch ($Computer -eq $env:ComputerName) {
                    $true {
                        Get-CimInstance @getGUIDSplat @connectionSplat
                    }
                    $false {
                        Get-CCMCimInstance @getGUIDSplat @connectionSplat
                    }
                }
                if ($CurrentGUID -is [Object] -and $CurrentGUID.Count -gt 0) {
                    foreach ($GUID in $CurrentGUID) {
                        $Result['GUID'] = $GUID.ClientID
                        $Result['ClientGUIDChangeDate'] = $GUID.ClientIDChangeDate
                        $Result['PreviousGUID'] = $GUID.PreviousClientID
                        [PSCustomObject]$Result
                    }
                }
                else {
                    Write-Warning "No ClientID information found for $Computer"
                }
            }
            catch {
                $ErrorMessage = $_.Exception.Message
                Write-Error $ErrorMessage
            }
        }
    }
}