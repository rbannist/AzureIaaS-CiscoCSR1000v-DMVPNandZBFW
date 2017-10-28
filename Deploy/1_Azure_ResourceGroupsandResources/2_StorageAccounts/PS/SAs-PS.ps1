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
$sasku1 = "Standard_LRS"

New-AzureRmStorageAccount -ResourceGroupName rb-$Site1code-$Appcode-$Stage1code-sdisk-rg01 -Location $Site1 -AccountName rbweaaadqasadisk01 -SkuName $sasku1 -Tag @{ App="$App";  Stage="$Stage1" }
New-AzureRmStorageAccount -ResourceGroupName rb-$Site2code-$Appcode-$Stage1code-sdisk-rg01 -Location $Site2 -AccountName rbseaaaadqasadisk01 -SkuName $sasku1 -Tag @{ App="$App";  Stage="$Stage1" }
New-AzureRmStorageAccount -ResourceGroupName rb-$Site3code-$Appcode-$Stage1code-sdisk-rg01 -Location $Site3 -AccountName rbeusaaadqasadisk01 -SkuName $sasku1 -Tag @{ App="$App";  Stage="$Stage1" }
New-AzureRmStorageAccount -ResourceGroupName rb-$Site1code-$Appcode-$Stage2code-sdisk-rg01 -Location $Site1 -AccountName rbweaaaprodsadisk01 -SkuName $sasku1 -Tag @{ App="$App";  Stage="$Stage2" }
New-AzureRmStorageAccount -ResourceGroupName rb-$Site2code-$Appcode-$Stage2code-sdisk-rg01 -Location $Site2 -AccountName rbseaaaaprodsadisk01 -SkuName $sasku1 -Tag @{ App="$App";  Stage="$Stage2" }
New-AzureRmStorageAccount -ResourceGroupName rb-$Site3code-$Appcode-$Stage2code-sdisk-rg01 -Location $Site3 -AccountName rbeusaaaprodsadisk01 -SkuName $sasku1 -Tag @{ App="$App";  Stage="$Stage2" }
New-AzureRmStorageAccount -ResourceGroupName rb-$Site1code-$Appcode-$Stage1code-sdiag-rg01 -Location $Site1 -AccountName rbweaaadqasadiag01 -SkuName $sasku1 -Tag @{ App="$App";  Stage="$Stage1" }
New-AzureRmStorageAccount -ResourceGroupName rb-$Site2code-$Appcode-$Stage1code-sdiag-rg01 -Location $Site2 -AccountName rbseaaaadqasadiag01 -SkuName $sasku11 -Tag @{ App="$App";  Stage="$Stage1" }
New-AzureRmStorageAccount -ResourceGroupName rb-$Site3code-$Appcode-$Stage1code-sdiag-rg01 -Location $Site3 -AccountName rbeusaaadqasadiag01 -SkuName $sasku1 -Tag @{ App="$App";  Stage="$Stage1" }
New-AzureRmStorageAccount -ResourceGroupName rb-$Site1code-$Appcode-$Stage2code-sdiag-rg01 -Location $Site1 -AccountName rbweaaaprodsadiag01 -SkuName $sasku1 -Tag @{ App="$App";  Stage="$Stage2" }
New-AzureRmStorageAccount -ResourceGroupName rb-$Site2code-$Appcode-$Stage2code-sdiag-rg01 -Location $Site2 -AccountName rbseaaaaprodsadiag01 -SkuName $sasku1 -Tag @{ App="$App";  Stage="$Stage2" }
New-AzureRmStorageAccount -ResourceGroupName rb-$Site3code-$Appcode-$Stage2code-sdiag-rg01 -Location $Site3 -AccountName rbeusaaaprodsadiag01 -SkuName $sasku1 -Tag @{ App="$App";  Stage="$Stage2" }
