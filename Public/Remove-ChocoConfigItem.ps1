function Remove-ChocoConfigItem {
    <#
        .SYNOPSIS
        Unsets the chosen configuration item

        .DESCRIPTION
        This command wraps 'choco config' to make setting configuration items easier. Dynamically generates names from configuration file.

        .PARAMETER Name

        The name of the configuration item to change

        .EXAMPLE
        Remove-ChocoConfigItem -Name proxy

        Sets the proxy configuration setting to a blank default value
    #>
    [cmdletBinding(SupportsShouldProcess,ConfirmImpact="High",HelpUri="https://github.com/steviecoaster/PSChocoConfig/blob/master/docs/Remove-ChocoConfigItem.md")]
    Param (
        [Parameter(Mandatory,Position=0)]
        [String]
        $Name

    )

    process {

        If($PSCmdlet.ShouldProcess("$Name","Setting value: $Value")){
        
            $choco = choco config unset --name="'$Name'"
            Write-Host "$($choco[-1])"-ForegroundColor Yellow
        
        }
    }

}