$App = "AAA"
$Appcode "aaa"
$Stage1 = "DevQA"
$Stage2 = "Prod"
$Stage1code = "dqa"
$Stage2code = "prod"
$Site4 = "westus"
$Site4code = "wus"
$sasku1 = "Standard_LRS"

New-AzureRmStorageAccount -ResourceGroupName rb-$Site4code-$Appcode-$Stage1code-sdisk-rg01 -Location $Site4 -AccountName rbseaaaadqasadisk01 -SkuName $sasku1 -Tag @{ App="$App";  Stage="$Stage1" }
New-AzureRmStorageAccount -ResourceGroupName rb-$Site4code-$Appcode-$Stage2code-sdisk-rg01 -Location $Site4 -AccountName rbseaaaaprodsadisk01 -SkuName $sasku1 -Tag @{ App="$App";  Stage="$Stage2" }
New-AzureRmStorageAccount -ResourceGroupName rb-$Site4code-$Appcode-$Stage1code-sdiag-rg01 -Location $Site4 -AccountName rbseaaaadqasadiag01 -SkuName $sasku1 -Tag @{ App="$App";  Stage="$Stage1" }
New-AzureRmStorageAccount -ResourceGroupName rb-$Site4code-$Appcode-$Stage2code-sdiag-rg01 -Location $Site4 -AccountName rbseaaaaprodsadiag01 -SkuName $sasku1 -Tag @{ App="$App";  Stage="$Stage2" }
