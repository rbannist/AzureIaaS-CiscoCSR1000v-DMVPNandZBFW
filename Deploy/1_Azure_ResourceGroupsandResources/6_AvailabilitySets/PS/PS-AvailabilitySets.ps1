$App = "AAA"
$Appcode = "aaa"
$Stage1 = "DevQA"
$Stage2 = "Prod"
$Stage1code = "dqa"
$Stage2code = "prod"
$Site1 = "westeurope"
$Site2 = "southeastasia"
$Site3 = "eastus"
$Site1code = "we"
$Site2code = "sea"
$Site3code = "eus"
$Site1Stage1CSRVMRG = "rb-$Site1code-$Appcode-$Stage1code-csrvm-rg01"
$Site2Stage1CSRVMRG = "rb-$Site2code-$Appcode-$Stage1code-csrvm-rg01"
$Site3Stage1CSRVMRG = "rb-$Site3code-$Appcode-$Stage1code-csrvm-rg01"
$Site1Stage2CSRVMRG = "rb-$Site1code-$Appcode-$Stage2code-csrvm-rg01"
$Site2Stage2CSRVMRG = "rb-$Site2code-$Appcode-$Stage2code-csrvm-rg01"
$Site3Stage2CSRVMRG = "rb-$Site3code-$Appcode-$Stage2code-csrvm-rg01"
$Site1Stage1CSRVMAS = "rb-$Site1code-$Appcode-$Stage1code-csrvm-as01"
$Site2Stage1CSRVMAS = "rb-$Site2code-$Appcode-$Stage1code-csrvm-as01"
$Site3Stage1CSRVMAS = "rb-$Site3code-$Appcode-$Stage1code-csrvm-as01"
$Site1Stage2CSRVMAS = "rb-$Site1code-$Appcode-$Stage2code-csrvm-as01"
$Site2Stage2CSRVMAS = "rb-$Site2code-$Appcode-$Stage2code-csrvm-as01"
$Site3Stage2CSRVMAS = "rb-$Site3code-$Appcode-$Stage2code-csrvm-as01"

New-AzureRmAvailabilitySet -Location "$Site1" -Name $Site1Stage1CSRVMAS -ResourceGroupName "$Site1Stage1CSRVMRG" -PlatformFaultDomainCount 3 -PlatformUpdateDomainCount 4
New-AzureRmAvailabilitySet -Location "$Site2" -Name $Site2Stage1CSRVMAS -ResourceGroupName "$Site2Stage1CSRVMRG" -PlatformFaultDomainCount 3 -PlatformUpdateDomainCount 4
New-AzureRmAvailabilitySet -Location "$Site3" -Name $Site3Stage1CSRVMAS -ResourceGroupName "$Site3Stage1CSRVMRG" -PlatformFaultDomainCount 3 -PlatformUpdateDomainCount 4
New-AzureRmAvailabilitySet -Location "$Site1" -Name $Site1Stage2CSRVMAS -ResourceGroupName "$Site1Stage2CSRVMRG" -PlatformFaultDomainCount 3 -PlatformUpdateDomainCount 4
New-AzureRmAvailabilitySet -Location "$Site2" -Name $Site2Stage2CSRVMAS -ResourceGroupName "$Site2Stage2CSRVMRG" -PlatformFaultDomainCount 3 -PlatformUpdateDomainCount 4
New-AzureRmAvailabilitySet -Location "$Site3" -Name $Site3Stage2CSRVMAS -ResourceGroupName "$Site3Stage2CSRVMRG" -PlatformFaultDomainCount 3 -PlatformUpdateDomainCount 4


$azureRGInfo11 = Get-AzureRmResourceGroup -Name $Site1Stage1CSRVMRG
foreach ($item in $azureRGInfo11) 
{
Find-AzureRmResource -ResourceGroupNameEquals $item.ResourceGroupName | ForEach-Object {Set-AzureRmResource -ResourceId $PSItem.ResourceId -Tag $item.Tags -Force } 
}
$azureRGInfo21 = Get-AzureRmResourceGroup -Name $Site2Stage1CSRVMRG
foreach ($item in $azureRGInfo21) 
{
Find-AzureRmResource -ResourceGroupNameEquals $item.ResourceGroupName | ForEach-Object {Set-AzureRmResource -ResourceId $PSItem.ResourceId -Tag $item.Tags -Force } 
}
$azureRGInfo31 = Get-AzureRmResourceGroup -Name $Site3Stage1CSRVMRG
foreach ($item in $azureRGInfo31) 
{
Find-AzureRmResource -ResourceGroupNameEquals $item.ResourceGroupName | ForEach-Object {Set-AzureRmResource -ResourceId $PSItem.ResourceId -Tag $item.Tags -Force } 
}
$azureRGInfo12 = Get-AzureRmResourceGroup -Name $Site1Stage2CSRVMRG
foreach ($item in $azureRGInfo12) 
{
Find-AzureRmResource -ResourceGroupNameEquals $item.ResourceGroupName | ForEach-Object {Set-AzureRmResource -ResourceId $PSItem.ResourceId -Tag $item.Tags -Force } 
}
$azureRGInfo22 = Get-AzureRmResourceGroup -Name $Site2Stage2CSRVMRG
foreach ($item in $azureRGInfo22) 
{
Find-AzureRmResource -ResourceGroupNameEquals $item.ResourceGroupName | ForEach-Object {Set-AzureRmResource -ResourceId $PSItem.ResourceId -Tag $item.Tags -Force } 
}
$azureRGInfo32 = Get-AzureRmResourceGroup -Name $Site3Stage2CSRVMRG
foreach ($item in $azureRGInfo32) 
{
Find-AzureRmResource -ResourceGroupNameEquals $item.ResourceGroupName | ForEach-Object {Set-AzureRmResource -ResourceId $PSItem.ResourceId -Tag $item.Tags -Force } 
}