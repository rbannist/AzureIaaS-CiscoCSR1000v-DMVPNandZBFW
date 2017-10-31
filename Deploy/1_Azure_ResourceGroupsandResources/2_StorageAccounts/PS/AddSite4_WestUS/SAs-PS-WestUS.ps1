$Org = "RB"
$Orgcode = "rb"
$App = "AAA"
$Appcode "aaa"
$Stage1 = "DevQA"
$Stage2 = "Prod"
$Stage1code = "dqa"
$Stage2code = "prod"
$Site4 = "westus"
$Site4code = "wus"
$SASku1 = "Standard_LRS"
$DiskSAID1 = "sadisk01"
$DiagSAID1 = "sadiag01"

New-AzureRmStorageAccount -ResourceGroupName rb-$Site4code-$Appcode-$Stage1code-sdisk-rg01 -Location $Site4 -AccountName $Orgcode$Site4code$Appcode$Stage1code$DiskSAID1 -SkuName $SASku1 -Tag @{ Org="$Org"; App="$App"; Stage="$Stage1" }
New-AzureRmStorageAccount -ResourceGroupName rb-$Site4code-$Appcode-$Stage2code-sdisk-rg01 -Location $Site4 -AccountName $Orgcode$Site4code$Appcode$Stage2code$DiskSAID1 -SkuName $SASku1 -Tag @{ Org="$Org"; App="$App"; Stage="$Stage2" }
New-AzureRmStorageAccount -ResourceGroupName rb-$Site4code-$Appcode-$Stage1code-sdiag-rg01 -Location $Site4 -AccountName $Orgcode$Site4code$Appcode$Stage1code$DiagSAID1 -SkuName $SASku1 -Tag @{ Org="$Org"; App="$App"; Stage="$Stage1" }
New-AzureRmStorageAccount -ResourceGroupName rb-$Site4code-$Appcode-$Stage2code-sdiag-rg01 -Location $Site4 -AccountName $Orgcode$Site4code$Appcode$Stage2code$DiagSAID1 -SkuName $SASku1 -Tag @{ Org="$Org"; App="$App"; Stage="$Stage2" }
