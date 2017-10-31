$Org = "RB"
$Orgcode = "rb"
$App = "AAA"
$Appcode = "aaa"
$Stage1 = "DevQA"
$Stage2 = "Prod"
$Stage1code = "dqa"
$Stage2code = "prod"
$Site4 = "westus"
$Site4code = "wus"
$Site4Stage1CSRVMRG = "$Orgcode-$Site4code-$Appcode-$Stage1code-csrvm-rg01"
$Site4Stage2CSRVMRG = "$Orgcode-$Site4code-$Appcode-$Stage2code-csrvm-rg01"
$Site4Stage1CSRVMAS = "$Orgcode-$Site4code-$Appcode-$Stage1code-csrvm-as01"
$Site4Stage2CSRVMAS = "$Orgcode-$Site4code-$Appcode-$Stage2code-csrvm-as01"

New-AzureRmAvailabilitySet -Location "$Site4" -Name $Site4Stage1CSRVMAS -ResourceGroupName "$Site4Stage1CSRVMRG" -PlatformFaultDomainCount 3 -PlatformUpdateDomainCount 4
New-AzureRmAvailabilitySet -Location "$Site4" -Name $Site4Stage2CSRVMAS -ResourceGroupName "$Site4Stage2CSRVMRG" -PlatformFaultDomainCount 3 -PlatformUpdateDomainCount 4


$azureRGInfo31 = Get-AzureRmResourceGroup -Name $Site4Stage1CSRVMRG
foreach ($item in $azureRGInfo31) 
{
Find-AzureRmResource -ResourceGroupNameEquals $item.ResourceGroupName | ForEach-Object {Set-AzureRmResource -ResourceId $PSItem.ResourceId -Tag $item.Tags -Force } 
}
$azureRGInfo32 = Get-AzureRmResourceGroup -Name $Site4Stage2CSRVMRG
foreach ($item in $azureRGInfo32) 
{
Find-AzureRmResource -ResourceGroupNameEquals $item.ResourceGroupName | ForEach-Object {Set-AzureRmResource -ResourceId $PSItem.ResourceId -Tag $item.Tags -Force } 
}