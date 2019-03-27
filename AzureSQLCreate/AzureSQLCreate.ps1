# Connect-AzAccount
# The SubscriptionId in which to create these objects
# From https://portal.azure.com \ Cost Management + Billing \ Billing - Subscriptions \ My Subscritions
$SubscriptionId = 'c849afaa-e90b-4ac8-a121-cf2a48b19b0b'
# Set the resource group name and location for your server
$resourceGroupName = "rgCheekayMunkayBob"
$location = "westus2"
# Set an admin login and password for your server
$adminSqlLogin = "MySqlAdministrator"
$password = "ROOT#123"
# Set server name - the logical server name has to be unique in the system
$serverName = "svrCheekayMunkayBob"
# The sample database name
$databaseName = "dbCheekayMunkayBob"
# The ip address range that you want to allow to access your server
$startIp = "71.212.139.0"
$endIp = "71.212.139.255"


Write-Host "`n`n********************************************************************************************"
Write-Host "Set subscription"
Set-AzContext -SubscriptionId $subscriptionId


Write-Host "`n`n********************************************************************************************"
Write-Host "Create a resource group"
$resourceGroup = New-AzResourceGroup -Name $resourceGroupName -Location $location
Get-AzResourceGroup -Name $resourceGroupName


Write-Host "`n`n********************************************************************************************"
Write-Host "Create a server with a system wide unique server name"
Write-Host "- Takes a little while to execute, things will continue on soon, I promise..."
$server = New-AzSqlServer -ResourceGroupName $resourceGroupName `
    -ServerName $serverName `
    -Location $location `
    -SqlAdministratorCredentials $(New-Object -TypeName System.Management.Automation.PSCredential -ArgumentList $adminSqlLogin, $(ConvertTo-SecureString -String $password -AsPlainText -Force))
Get-AzSqlServer -ResourceGroupName $resourceGroupName


Write-Host "`n`n********************************************************************************************"
Write-Host "Create a server firewall rule that allows access from the specified IP range"
$serverFirewallRule = New-AzSqlServerFirewallRule -ResourceGroupName $resourceGroupName -ServerName $serverName.ToLower() `
    -FirewallRuleName "AllowedIPs" `
    -StartIpAddress $startIp `
    -EndIpAddress $endIp
Get-AzSqlServerFirewallRule -ResourceGroupName $resourceGroupName -ServerName $serverName.ToLower()
# To remove before a re-declaration
# Remove-AzSqlServerFirewallRule -ResourceGroupName $resourceGroupName -ServerName $serverName.ToLower() -FirewallRuleName "AllowedIPs"


Write-Host "`n`n********************************************************************************************"
Write-Host "Create a blank database with an S0 performance level"
Write-Host "- Takes a little while to execute, things will continue on soon, I promise..."
$database = New-AzSqlDatabase -ResourceGroupName $resourceGroupName `
    -ServerName $serverName `
    -DatabaseName $databaseName `
    -RequestedServiceObjectiveName "S0" `
    -SampleName "AdventureWorksLT"
Get-AzSqlDatabase -ResourceGroupName $resourceGroupName -ServerName $serverName -DatabaseName $databaseName



# Clean up deployment 
# Remove-AzResourceGroup -ResourceGroupName $resourceGroupName
#   - Takes a little while to execute, things will continue on soon, I promise
