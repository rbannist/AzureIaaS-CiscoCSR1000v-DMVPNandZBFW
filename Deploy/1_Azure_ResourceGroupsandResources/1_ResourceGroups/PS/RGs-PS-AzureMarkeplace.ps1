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


New-AzureRmResourceGroup -Name $Orgcode-$Site1code-$Appcode-$Stage1code-sdisk-rg01 -Location $Site1 -Tag @{ Org="$Org"; App="$App"; Stage="$Stage1" }
New-AzureRmResourceGroup -Name $Orgcode-$Site2code-$Appcode-$Stage1code-sdisk-rg01 -Location $Site2 -Tag @{ Org="$Org"; App="$App"; Stage="$Stage1" }
New-AzureRmResourceGroup -Name $Orgcode-$Site3code-$Appcode-$Stage1code-sdisk-rg01 -Location $Site3 -Tag @{ Org="$Org"; App="$App"; Stage="$Stage1" }
New-AzureRmResourceGroup -Name $Orgcode-$Site1code-$Appcode-$Stage2code-sdisk-rg01 -Location $Site1 -Tag @{ Org="$Org"; App="$App"; Stage="$Stage2" }
New-AzureRmResourceGroup -Name $Orgcode-$Site2code-$Appcode-$Stage2code-sdisk-rg01 -Location $Site2 -Tag @{ Org="$Org"; App="$App"; Stage="$Stage2" }
New-AzureRmResourceGroup -Name $Orgcode-$Site3code-$Appcode-$Stage2code-sdisk-rg01 -Location $Site3 -Tag @{ Org="$Org"; App="$App"; Stage="$Stage2" }
New-AzureRmResourceGroup -Name $Orgcode-$Site1code-$Appcode-$Stage1code-sdiag-rg01 -Location $Site1 -Tag @{ Org="$Org"; App="$App"; Stage="$Stage1" }
New-AzureRmResourceGroup -Name $Orgcode-$Site2code-$Appcode-$Stage1code-sdiag-rg01 -Location $Site2 -Tag @{ Org="$Org"; App="$App"; Stage="$Stage1" }
New-AzureRmResourceGroup -Name $Orgcode-$Site3code-$Appcode-$Stage1code-sdiag-rg01 -Location $Site3 -Tag @{ Org="$Org"; App="$App"; Stage="$Stage1" }
New-AzureRmResourceGroup -Name $Orgcode-$Site1code-$Appcode-$Stage2code-sdiag-rg01 -Location $Site1 -Tag @{ Org="$Org"; App="$App"; Stage="$Stage2" }
New-AzureRmResourceGroup -Name $Orgcode-$Site2code-$Appcode-$Stage2code-sdiag-rg01 -Location $Site2 -Tag @{ Org="$Org"; App="$App"; Stage="$Stage2" }
New-AzureRmResourceGroup -Name $Orgcode-$Site3code-$Appcode-$Stage2code-sdiag-rg01 -Location $Site3 -Tag @{ Org="$Org"; App="$App"; Stage="$Stage2" }
New-AzureRmResourceGroup -Name $Orgcode-$Site1code-$Appcode-$Stage1code-pipm-rg01 -Location $Site1 -Tag @{ Org="$Org"; App="$App"; Stage="$Stage1" }
New-AzureRmResourceGroup -Name $Orgcode-$Site2code-$Appcode-$Stage1code-pipm-rg01 -Location $Site2 -Tag @{ Org="$Org"; App="$App"; Stage="$Stage1" }
New-AzureRmResourceGroup -Name $Orgcode-$Site3code-$Appcode-$Stage1code-pipm-rg01 -Location $Site3 -Tag @{ Org="$Org"; App="$App"; Stage="$Stage1" }
New-AzureRmResourceGroup -Name $Orgcode-$Site1code-$Appcode-$Stage2code-pipm-rg01 -Location $Site1 -Tag @{ Org="$Org"; App="$App"; Stage="$Stage2" }
New-AzureRmResourceGroup -Name $Orgcode-$Site2code-$Appcode-$Stage2code-pipm-rg01 -Location $Site2 -Tag @{ Org="$Org"; App="$App"; Stage="$Stage2" }
New-AzureRmResourceGroup -Name $Orgcode-$Site3code-$Appcode-$Stage2code-pipm-rg01 -Location $Site3 -Tag @{ Org="$Org"; App="$App"; Stage="$Stage2" }
New-AzureRmResourceGroup -Name $Orgcode-$Site1code-$Appcode-$Stage1code-pipd-rg01 -Location $Site1 -Tag @{ Org="$Org"; App="$App"; Stage="$Stage1" }
New-AzureRmResourceGroup -Name $Orgcode-$Site2code-$Appcode-$Stage1code-pipd-rg01 -Location $Site2 -Tag @{ Org="$Org"; App="$App"; Stage="$Stage1" }
New-AzureRmResourceGroup -Name $Orgcode-$Site3code-$Appcode-$Stage1code-pipd-rg01 -Location $Site3 -Tag @{ Org="$Org"; App="$App"; Stage="$Stage1" }
New-AzureRmResourceGroup -Name $Orgcode-$Site1code-$Appcode-$Stage2code-pipd-rg01 -Location $Site1 -Tag @{ Org="$Org"; App="$App"; Stage="$Stage2" }
New-AzureRmResourceGroup -Name $Orgcode-$Site2code-$Appcode-$Stage2code-pipd-rg01 -Location $Site2 -Tag @{ Org="$Org"; App="$App"; Stage="$Stage2" }
New-AzureRmResourceGroup -Name $Orgcode-$Site3code-$Appcode-$Stage2code-pipd-rg01 -Location $Site3 -Tag @{ Org="$Org"; App="$App"; Stage="$Stage2" }
New-AzureRmResourceGroup -Name $Orgcode-$Site1code-$Appcode-$Stage1code-tstvm-rg01 -Location $Site1 -Tag @{ Org="$Org"; App="$App"; Stage="$Stage1" }
New-AzureRmResourceGroup -Name $Orgcode-$Site2code-$Appcode-$Stage1code-tstvm-rg01 -Location $Site2 -Tag @{ Org="$Org"; App="$App"; Stage="$Stage1" }
New-AzureRmResourceGroup -Name $Orgcode-$Site3code-$Appcode-$Stage1code-tstvm-rg01 -Location $Site3 -Tag @{ Org="$Org"; App="$App"; Stage="$Stage1" }
New-AzureRmResourceGroup -Name $Orgcode-$Site1code-$Appcode-$Stage2code-tstvm-rg01 -Location $Site1 -Tag @{ Org="$Org"; App="$App"; Stage="$Stage2" }
New-AzureRmResourceGroup -Name $Orgcode-$Site2code-$Appcode-$Stage2code-tstvm-rg01 -Location $Site2 -Tag @{ Org="$Org"; App="$App"; Stage="$Stage2" }
New-AzureRmResourceGroup -Name $Orgcode-$Site3code-$Appcode-$Stage2code-tstvm-rg01 -Location $Site3 -Tag @{ Org="$Org"; App="$App"; Stage="$Stage2" }
New-AzureRmResourceGroup -Name $Orgcode-$Site1code-$Appcode-$Stage1code-csrcr-rg01 -Location $Site1 -Tag @{ Org="$Org"; App="$App"; Stage="$Stage1" }
New-AzureRmResourceGroup -Name $Orgcode-$Site2code-$Appcode-$Stage1code-csrcr-rg01 -Location $Site2 -Tag @{ Org="$Org"; App="$App"; Stage="$Stage1" }
New-AzureRmResourceGroup -Name $Orgcode-$Site3code-$Appcode-$Stage1code-csrcr-rg01 -Location $Site3 -Tag @{ Org="$Org"; App="$App"; Stage="$Stage1" }
New-AzureRmResourceGroup -Name $Orgcode-$Site1code-$Appcode-$Stage2code-csrcr-rg01 -Location $Site1 -Tag @{ Org="$Org"; App="$App"; Stage="$Stage2" }
New-AzureRmResourceGroup -Name $Orgcode-$Site2code-$Appcode-$Stage2code-csrcr-rg01 -Location $Site2 -Tag @{ Org="$Org"; App="$App"; Stage="$Stage2" }
New-AzureRmResourceGroup -Name $Orgcode-$Site3code-$Appcode-$Stage2code-csrcr-rg01 -Location $Site3 -Tag @{ Org="$Org"; App="$App"; Stage="$Stage2" }
New-AzureRmResourceGroup -Name $Orgcode-$Site1code-$Appcode-$Stage1code-csrvm-rg101 -Location $Site1 -Tag @{ Org="$Org"; App="$App"; Stage="$Stage1" }
New-AzureRmResourceGroup -Name $Orgcode-$Site1code-$Appcode-$Stage1code-csrvm-rg102 -Location $Site1 -Tag @{ Org="$Org"; App="$App"; Stage="$Stage1" }
New-AzureRmResourceGroup -Name $Orgcode-$Site2code-$Appcode-$Stage1code-csrvm-rg101 -Location $Site2 -Tag @{ Org="$Org"; App="$App"; Stage="$Stage1" }
New-AzureRmResourceGroup -Name $Orgcode-$Site2code-$Appcode-$Stage1code-csrvm-rg102 -Location $Site2 -Tag @{ Org="$Org"; App="$App"; Stage="$Stage1" }
New-AzureRmResourceGroup -Name $Orgcode-$Site3code-$Appcode-$Stage1code-csrvm-rg101 -Location $Site3 -Tag @{ Org="$Org"; App="$App"; Stage="$Stage1" }
New-AzureRmResourceGroup -Name $Orgcode-$Site3code-$Appcode-$Stage1code-csrvm-rg102 -Location $Site3 -Tag @{ Org="$Org"; App="$App"; Stage="$Stage1" }
New-AzureRmResourceGroup -Name $Orgcode-$Site1code-$Appcode-$Stage2code-csrvm-rg101 -Location $Site1 -Tag @{ Org="$Org"; App="$App"; Stage="$Stage2" }
New-AzureRmResourceGroup -Name $Orgcode-$Site1code-$Appcode-$Stage2code-csrvm-rg102 -Location $Site1 -Tag @{ Org="$Org"; App="$App"; Stage="$Stage2" }
New-AzureRmResourceGroup -Name $Orgcode-$Site2code-$Appcode-$Stage2code-csrvm-rg101 -Location $Site2 -Tag @{ Org="$Org"; App="$App"; Stage="$Stage2" }
New-AzureRmResourceGroup -Name $Orgcode-$Site2code-$Appcode-$Stage2code-csrvm-rg102 -Location $Site2 -Tag @{ Org="$Org"; App="$App"; Stage="$Stage2" }
New-AzureRmResourceGroup -Name $Orgcode-$Site3code-$Appcode-$Stage2code-csrvm-rg101 -Location $Site3 -Tag @{ Org="$Org"; App="$App"; Stage="$Stage2" }
New-AzureRmResourceGroup -Name $Orgcode-$Site3code-$Appcode-$Stage2code-csrvm-rg102 -Location $Site3 -Tag @{ Org="$Org"; App="$App"; Stage="$Stage2" } 