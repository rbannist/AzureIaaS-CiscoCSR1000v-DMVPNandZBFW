$App = "aaa"
$Stage2 = "devqa"
$Stage2 = "prod"
$Site1 = "westeurope"
$Site2 = "southeastasia"
$Site3 = "eastus"
$Site4 = "westus"
$sasku1 = "Standard_LRS"
$Site1Stage2CSRVMRG = "rb-we-aaa-prod-csrvm-rg01"
$Site2Stage2CSRVMRG = "rb-sea-aaa-prod-csrvm-rg01"
$Site3Stage2CSRVMRG = "rb-eus-aaa-prod-csrvm-rg01"
$Site4Stage2CSRVMRG = "rb-wus-aaa-prod-csrvm-rg01"
$Site1Stage2CSRVMAS = "rb-we-aaa-prod-csrvm-as01"
$Site2Stage2CSRVMAS = "rb-sea-aaa-prod-csrvm-as01"
$Site3Stage2CSRVMAS = "rb-eus-aaa-prod-csrvm-as01"
$Site4Stage2CSRVMAS = "rb-wus-aaa-prod-csrvm-as01"
$Site1Stage2SDISKRG = "rb-we-aaa-prod-sdisk-rg01"
$Site2Stage2SDISKRG = "rb-sea-aaa-prod-sdisk-rg01"
$Site3Stage2SDISKRG = "rb-eus-aaa-prod-sdisk-rg01"
$Site4Stage2SDISKRG = "rb-wus-aaa-prod-sdisk-rg01"
$Site1Stage2SDIAGRG = "rb-we-aaa-prod-sdiag-rg01"
$Site2Stage2SDIAGRG = "rb-sea-aaa-prod-sdiag-rg01"
$Site3Stage2SDIAGRG = "rb-eus-aaa-prod-sdiag-rg01"
$Site4Stage2SDIAGRG = "rb-wus-aaa-prod-sdiag-rg01"
$Site1Stage2SADISK = "rbweaaaprodsadisk01"
$Site2Stage2SADISK = "rbseaaaaprodsadisk01"
$Site3Stage2SADISK = "rbeusaaaprodsadisk01"
$Site4Stage2SADISK = "rbwusaaaprodsadisk01"
$Site1Stage2SADIAG = "rbweaaaprodsadiag01"
$Site2Stage2SADIAG = "rbseaaaaprodsadiag01"
$Site3Stage2SADIAG = "rbeusaaaprodsadiag01"
$Site4Stage2SADIAG = "rbwusaaaprodsadiag01"


Remove-AzureRmResourceGroup -Name $Site1Stage2CSRVMRG -force
Remove-AzureRmResourceGroup -Name $Site2Stage2CSRVMRG -force
Remove-AzureRmResourceGroup -Name $Site3Stage2CSRVMRG -force
Remove-AzureRmResourceGroup -Name $Site4Stage2CSRVMRG -force
Remove-AzureRmStorageAccount -ResourceGroupName $Site1Stage2SDISKRG -AccountName $Site1Stage2SADISK -force
Remove-AzureRmStorageAccount -ResourceGroupName $Site2Stage2SDISKRG -AccountName $Site2Stage2SADISK -force
Remove-AzureRmStorageAccount -ResourceGroupName $Site3Stage2SDISKRG -AccountName $Site3Stage2SADISK -force
Remove-AzureRmStorageAccount -ResourceGroupName $Site4Stage2SDISKRG -AccountName $Site4Stage2SADISK -force
Remove-AzureRmStorageAccount -ResourceGroupName $Site1Stage2SDIAGRG -AccountName $Site1Stage2SADIAG -force
Remove-AzureRmStorageAccount -ResourceGroupName $Site2Stage2SDIAGRG -AccountName $Site2Stage2SADIAG -force
Remove-AzureRmStorageAccount -ResourceGroupName $Site3Stage2SDIAGRG -AccountName $Site3Stage2SADIAG -force
Remove-AzureRmStorageAccount -ResourceGroupName $Site4Stage2SDIAGRG -AccountName $Site4Stage2SADIAG -force

New-AzureRmStorageAccount -ResourceGroupName $Site1Stage2SDISKRG -Location $Site1 -AccountName $Site1Stage2SADISK -SkuName $sasku1 -Tag @{ App="$App";  Stage="$Stage2" }
New-AzureRmStorageAccount -ResourceGroupName $Site2Stage2SDISKRG -Location $Site2 -AccountName $Site2Stage2SADISK -SkuName $sasku1 -Tag @{ App="$App";  Stage="$Stage2" }
New-AzureRmStorageAccount -ResourceGroupName $Site3Stage2SDISKRG -Location $Site3 -AccountName $Site3Stage2SADISK -SkuName $sasku1 -Tag @{ App="$App";  Stage="$Stage2" }
New-AzureRmStorageAccount -ResourceGroupName $Site4Stage2SDISKRG -Location $Site4 -AccountName $Site4Stage2SADISK -SkuName $sasku1 -Tag @{ App="$App";  Stage="$Stage2" }
New-AzureRmStorageAccount -ResourceGroupName $Site1Stage2SDIAGRG -Location $Site1 -AccountName $Site1Stage2SADIAG -SkuName $sasku1 -Tag @{ App="$App";  Stage="$Stage2" }
New-AzureRmStorageAccount -ResourceGroupName $Site2Stage2SDIAGRG -Location $Site2 -AccountName $Site2Stage2SADIAG -SkuName $sasku1 -Tag @{ App="$App";  Stage="$Stage2" }
New-AzureRmStorageAccount -ResourceGroupName $Site3Stage2SDIAGRG -Location $Site3 -AccountName $Site3Stage2SADIAG -SkuName $sasku1 -Tag @{ App="$App";  Stage="$Stage2" }
New-AzureRmStorageAccount -ResourceGroupName $Site4Stage2SDIAGRG -Location $Site4 -AccountName $Site3Stage2SADIAG -SkuName $sasku1 -Tag @{ App="$App";  Stage="$Stage2" }

New-AzureRmResourceGroup -Name $Site1Stage2CSRVMRG -Location $Site1 -Tag @{ App="$App";  Stage="$Stage2" }
New-AzureRmResourceGroup -Name $Site2Stage2CSRVMRG -Location $Site2 -Tag @{ App="$App";  Stage="$Stage2" }
New-AzureRmResourceGroup -Name $Site3Stage2CSRVMRG -Location $Site3 -Tag @{ App="$App";  Stage="$Stage2" }
New-AzureRmResourceGroup -Name $Site4Stage2CSRVMRG -Location $Site4 -Tag @{ App="$App";  Stage="$Stage2" }

New-AzureRmAvailabilitySet -Location "$Site1" -Name $Site1Stage2CSRVMAS -ResourceGroupName "$Site1Stage2CSRVMRG" -PlatformFaultDomainCount 3 -PlatformUpdateDomainCount 4
New-AzureRmAvailabilitySet -Location "$Site2" -Name $Site2Stage2CSRVMAS -ResourceGroupName "$Site2Stage2CSRVMRG" -PlatformFaultDomainCount 3 -PlatformUpdateDomainCount 4
New-AzureRmAvailabilitySet -Location "$Site3" -Name $Site3Stage2CSRVMAS -ResourceGroupName "$Site3Stage2CSRVMRG" -PlatformFaultDomainCount 3 -PlatformUpdateDomainCount 4
New-AzureRmAvailabilitySet -Location "$Site4" -Name $Site4Stage2CSRVMAS -ResourceGroupName "$Site4Stage2CSRVMRG" -PlatformFaultDomainCount 3 -PlatformUpdateDomainCount 4

$azureRGInfo11 = Get-AzureRmResourceGroup -Name $Site1Stage2CSRVMRG
foreach ($item in $azureRGInfo11) 
{
Find-AzureRmResource -ResourceGroupNameEquals $item.ResourceGroupName | ForEach-Object {Set-AzureRmResource -ResourceId $PSItem.ResourceId -Tag $item.Tags -Force } 
}
$azureRGInfo21 = Get-AzureRmResourceGroup -Name $Site2Stage2CSRVMRG
foreach ($item in $azureRGInfo21) 
{
Find-AzureRmResource -ResourceGroupNameEquals $item.ResourceGroupName | ForEach-Object {Set-AzureRmResource -ResourceId $PSItem.ResourceId -Tag $item.Tags -Force } 
}
$azureRGInfo31 = Get-AzureRmResourceGroup -Name $Site3Stage2CSRVMRG
foreach ($item in $azureRGInfo31) 
{
Find-AzureRmResource -ResourceGroupNameEquals $item.ResourceGroupName | ForEach-Object {Set-AzureRmResource -ResourceId $PSItem.ResourceId -Tag $item.Tags -Force } 
}
$azureRGInfo41 = Get-AzureRmResourceGroup -Name $Site4Stage2CSRVMRG
foreach ($item in $azureRGInfo41) 
{
Find-AzureRmResource -ResourceGroupNameEquals $item.ResourceGroupName | ForEach-Object {Set-AzureRmResource -ResourceId $PSItem.ResourceId -Tag $item.Tags -Force } 
}