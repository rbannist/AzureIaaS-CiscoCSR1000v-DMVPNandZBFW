$Org = "RB"
$Orgcode = "rb"
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
$SASku1 = "Standard_LRS"
$DiskSAID1 = "sadisk01"
$DiagSAID1 = "sadiag01"

New-AzureRmStorageAccount -ResourceGroupName $Orgcode-$Site1code-$Appcode-$Stage1code-sdisk-rg01 -Location $Site1 -AccountName $Orgcode$Site1code$Appcode$Stage1code$DiskSAID1 -SkuName $SASku1 -Tag @{ Org="$Org"; App="$App"; Stage="$Stage1" }
New-AzureRmStorageAccount -ResourceGroupName $Orgcode-$Site2code-$Appcode-$Stage1code-sdisk-rg01 -Location $Site2 -AccountName $Orgcode$Site2code$Appcode$Stage1code$DiskSAID1 -SkuName $SASku1 -Tag @{ Org="$Org"; App="$App"; Stage="$Stage1" }
New-AzureRmStorageAccount -ResourceGroupName $Orgcode-$Site3code-$Appcode-$Stage1code-sdisk-rg01 -Location $Site3 -AccountName $Orgcode$Site3code$Appcode$Stage1code$DiskSAID1 -SkuName $SASku1 -Tag @{ Org="$Org"; App="$App"; Stage="$Stage1" }
New-AzureRmStorageAccount -ResourceGroupName $Orgcode-$Site1code-$Appcode-$Stage2code-sdisk-rg01 -Location $Site1 -AccountName $Orgcode$Site1code$Appcode$Stage2code$DiskSAID1 -SkuName $SASku1 -Tag @{ Org="$Org"; App="$App"; Stage="$Stage2" }
New-AzureRmStorageAccount -ResourceGroupName $Orgcode-$Site2code-$Appcode-$Stage2code-sdisk-rg01 -Location $Site2 -AccountName $Orgcode$Site2code$Appcode$Stage2code$DiskSAID1 -SkuName $SASku1 -Tag @{ Org="$Org"; App="$App"; Stage="$Stage2" }
New-AzureRmStorageAccount -ResourceGroupName $Orgcode-$Site3code-$Appcode-$Stage2code-sdisk-rg01 -Location $Site3 -AccountName $Orgcode$Site3code$Appcode$Stage2code$DiskSAID1 -SkuName $SASku1 -Tag @{ Org="$Org"; App="$App"; Stage="$Stage2" }
New-AzureRmStorageAccount -ResourceGroupName $Orgcode-$Site1code-$Appcode-$Stage1code-sdiag-rg01 -Location $Site1 -AccountName $Orgcode$Site1code$Appcode$Stage1code$DiagSAID1 -SkuName $SASku1 -Tag @{ Org="$Org"; App="$App"; Stage="$Stage1" }
New-AzureRmStorageAccount -ResourceGroupName $Orgcode-$Site2code-$Appcode-$Stage1code-sdiag-rg01 -Location $Site2 -AccountName $Orgcode$Site2code$Appcode$Stage1code$DiagSAID1 -SkuName $SASku1 -Tag @{ Org="$Org"; App="$App"; Stage="$Stage1" }
New-AzureRmStorageAccount -ResourceGroupName $Orgcode-$Site3code-$Appcode-$Stage1code-sdiag-rg01 -Location $Site3 -AccountName $Orgcode$Site3code$Appcode$Stage1code$DiagSAID1 -SkuName $SASku1 -Tag @{ Org="$Org"; App="$App"; Stage="$Stage1" }
New-AzureRmStorageAccount -ResourceGroupName $Orgcode-$Site1code-$Appcode-$Stage2code-sdiag-rg01 -Location $Site1 -AccountName $Orgcode$Site1code$Appcode$Stage2code$DiagSAID1 -SkuName $SASku1 -Tag @{ Org="$Org"; App="$App"; Stage="$Stage2" }
New-AzureRmStorageAccount -ResourceGroupName $Orgcode-$Site2code-$Appcode-$Stage2code-sdiag-rg01 -Location $Site2 -AccountName $Orgcode$Site2code$Appcode$Stage2code$DiagSAID1 -SkuName $SASku1 -Tag @{ Org="$Org"; App="$App"; Stage="$Stage2" }
New-AzureRmStorageAccount -ResourceGroupName $Orgcode-$Site3code-$Appcode-$Stage2code-sdiag-rg01 -Location $Site3 -AccountName $Orgcode$Site3code$Appcode$Stage2code$DiagSAID1 -SkuName $SASku1 -Tag @{ Org="$Org"; App="$App"; Stage="$Stage2" }
