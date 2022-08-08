# End user feedback
Write-Host -ForegroundColor Green "Installing Active Directory management tools. . ."

# Install the AD Domain Services features
Install-WindowsFeature RSAT-Ad-AdminCenter, RSAT-AdDs-Tools

# End user feedback
Write-Host -ForegroundColor Green "Setting DNS server addresses. . ."

# Set DNS server addresses
Set-DnsClientServerAddress -InterfaceAlias "Ethernet 2" -ServerAddresses 192.168.0.5

# Wait a few
#Start-Sleep -Seconds 300

# End user feedback
Write-Host -ForegroundColor Green "Joining Active Directory domain. . ."

# Create password as secure string
$Password = ConvertTo-SecureString -String 'vagrant' -AsPlainText -Force

# Create credential object
$Credential = New-Object System.Management.Automation.PSCredential ('Administrator', $Password)

# Join domain
$Settings = @{
    DomainName       = "trenyol.lab"
    DomainCredential = $Credential
}
Add-Computer @Settings