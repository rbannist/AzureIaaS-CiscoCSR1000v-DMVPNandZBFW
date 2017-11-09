$App = "aaa"
$Stage1 = "devqa"
$Stage2 = "prod"
$Site1 = "westeurope"
$Site2 = "southeastasia"
$Site3 = "eastus"
$Site4 = "westus"
$sasku1 = "Standard_LRS"
$Site1Stage1CSRVMRG = "rb-we-aaa-dqa-csrvm-rg01"
$Site2Stage1CSRVMRG = "rb-sea-aaa-dqa-csrvm-rg01"
$Site3Stage1CSRVMRG = "rb-eus-aaa-dqa-csrvm-rg01"
$Site4Stage1CSRVMRG = "rb-wus-aaa-dqa-csrvm-rg01"
$Site1Stage1CSRVMAS = "rb-we-aaa-dqa-csrvm-as01"
$Site2Stage1CSRVMAS = "rb-sea-aaa-dqa-csrvm-as01"
$Site3Stage1CSRVMAS = "rb-eus-aaa-dqa-csrvm-as01"
$Site4Stage1CSRVMAS = "rb-wus-aaa-dqa-csrvm-as01"
$Site1Stage1SDISKRG = "rb-we-aaa-dqa-sdisk-rg01"
$Site2Stage1SDISKRG = "rb-sea-aaa-dqa-sdisk-rg01"
$Site3Stage1SDISKRG = "rb-eus-aaa-dqa-sdisk-rg01"
$Site4Stage1SDISKRG = "rb-wus-aaa-dqa-sdisk-rg01"
$Site1Stage1SDIAGRG = "rb-we-aaa-dqa-sdiag-rg01"
$Site2Stage1SDIAGRG = "rb-sea-aaa-dqa-sdiag-rg01"
$Site3Stage1SDIAGRG = "rb-eus-aaa-dqa-sdiag-rg01"
$Site4Stage1SDIAGRG = "rb-wus-aaa-dqa-sdiag-rg01"
$Site1Stage1SADISK = "rbweaaadqasadisk01"
$Site2Stage1SADISK = "rbseaaaadqasadisk01"
$Site3Stage1SADISK = "rbeusaaadqasadisk01"
$Site4Stage1SADISK = "rbwusaaadqasadisk01"
$Site1Stage1SADIAG = "rbweaaadqasadiag01"
$Site2Stage1SADIAG = "rbseaaaadqasadiag01"
$Site3Stage1SADIAG = "rbeusaaadqasadiag01"
$Site4Stage1SADIAG = "rbwusaaadqasadiag01"


Remove-AzureRmResourceGroup -Name $Site1Stage1CSRVMRG -force
Remove-AzureRmResourceGroup -Name $Site2Stage1CSRVMRG -force
Remove-AzureRmResourceGroup -Name $Site3Stage1CSRVMRG -force
Remove-AzureRmResourceGroup -Name $Site4Stage1CSRVMRG -force
Remove-AzureRmStorageAccount -ResourceGroupName $Site1Stage1SDISKRG -AccountName $Site1Stage1SADISK -force
Remove-AzureRmStorageAccount -ResourceGroupName $Site2Stage1SDISKRG -AccountName $Site2Stage1SADISK -force
Remove-AzureRmStorageAccount -ResourceGroupName $Site3Stage1SDISKRG -AccountName $Site3Stage1SADISK -force
Remove-AzureRmStorageAccount -ResourceGroupName $Site4Stage1SDISKRG -AccountName $Site4Stage1SADISK -force
Remove-AzureRmStorageAccount -ResourceGroupName $Site1Stage1SDIAGRG -AccountName $Site1Stage1SADIAG -force
Remove-AzureRmStorageAccount -ResourceGroupName $Site2Stage1SDIAGRG -AccountName $Site2Stage1SADIAG -force
Remove-AzureRmStorageAccount -ResourceGroupName $Site3Stage1SDIAGRG -AccountName $Site3Stage1SADIAG -force
Remove-AzureRmStorageAccount -ResourceGroupName $Site4Stage1SDIAGRG -AccountName $Site4Stage1SADIAG -force

New-AzureRmStorageAccount -ResourceGroupName $Site1Stage1SDISKRG -Location $Site1 -AccountName $Site1Stage1SADISK -SkuName $sasku1 -Tag @{ App="$App";  Stage="$Stage1" }
New-AzureRmStorageAccount -ResourceGroupName $Site2Stage1SDISKRG -Location $Site2 -AccountName $Site2Stage1SADISK -SkuName $sasku1 -Tag @{ App="$App";  Stage="$Stage1" }
New-AzureRmStorageAccount -ResourceGroupName $Site3Stage1SDISKRG -Location $Site3 -AccountName $Site3Stage1SADISK -SkuName $sasku1 -Tag @{ App="$App";  Stage="$Stage1" }
New-AzureRmStorageAccount -ResourceGroupName $Site4Stage1SDISKRG -Location $Site4 -AccountName $Site4Stage1SADISK -SkuName $sasku1 -Tag @{ App="$App";  Stage="$Stage1" }
New-AzureRmStorageAccount -ResourceGroupName $Site1Stage1SDIAGRG -Location $Site1 -AccountName $Site1Stage1SADIAG -SkuName $sasku1 -Tag @{ App="$App";  Stage="$Stage1" }
New-AzureRmStorageAccount -ResourceGroupName $Site2Stage1SDIAGRG -Location $Site2 -AccountName $Site2Stage1SADIAG -SkuName $sasku1 -Tag @{ App="$App";  Stage="$Stage1" }
New-AzureRmStorageAccount -ResourceGroupName $Site3Stage1SDIAGRG -Location $Site3 -AccountName $Site3Stage1SADIAG -SkuName $sasku1 -Tag @{ App="$App";  Stage="$Stage1" }
New-AzureRmStorageAccount -ResourceGroupName $Site4Stage1SDIAGRG -Location $Site4 -AccountName $Site3Stage1SADIAG -SkuName $sasku1 -Tag @{ App="$App";  Stage="$Stage1" }

New-AzureRmResourceGroup -Name $Site1Stage1CSRVMRG -Location $Site1 -Tag @{ App="$App";  Stage="$Stage1" }
New-AzureRmResourceGroup -Name $Site2Stage1CSRVMRG -Location $Site2 -Tag @{ App="$App";  Stage="$Stage1" }
New-AzureRmResourceGroup -Name $Site3Stage1CSRVMRG -Location $Site3 -Tag @{ App="$App";  Stage="$Stage1" }
New-AzureRmResourceGroup -Name $Site4Stage1CSRVMRG -Location $Site4 -Tag @{ App="$App";  Stage="$Stage1" }

New-AzureRmAvailabilitySet -Location "$Site1" -Name $Site1Stage1CSRVMAS -ResourceGroupName "$Site1Stage1CSRVMRG" -PlatformFaultDomainCount 3 -PlatformUpdateDomainCount 4
New-AzureRmAvailabilitySet -Location "$Site2" -Name $Site2Stage1CSRVMAS -ResourceGroupName "$Site2Stage1CSRVMRG" -PlatformFaultDomainCount 3 -PlatformUpdateDomainCount 4
New-AzureRmAvailabilitySet -Location "$Site3" -Name $Site3Stage1CSRVMAS -ResourceGroupName "$Site3Stage1CSRVMRG" -PlatformFaultDomainCount 3 -PlatformUpdateDomainCount 4
New-AzureRmAvailabilitySet -Location "$Site4" -Name $Site4Stage1CSRVMAS -ResourceGroupName "$Site4Stage1CSRVMRG" -PlatformFaultDomainCount 3 -PlatformUpdateDomainCount 4

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
$azureRGInfo41 = Get-AzureRmResourceGroup -Name $Site4Stage1CSRVMRG
foreach ($item in $azureRGInfo41) 
{
Find-AzureRmResource -ResourceGroupNameEquals $item.ResourceGroupName | ForEach-Object {Set-AzureRmResource -ResourceId $PSItem.ResourceId -Tag $item.Tags -Force } 
}