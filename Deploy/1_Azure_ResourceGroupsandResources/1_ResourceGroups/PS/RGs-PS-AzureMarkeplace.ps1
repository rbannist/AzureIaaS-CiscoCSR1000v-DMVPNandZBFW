$$App = "AAA"
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


New-AzureRmResourceGroup -Name rb-$Site1code-$App-$Stage1code-sdisk-rg01 -Location $Site1 -Tag @{ App="$App";  Stage="$Stage1" }
New-AzureRmResourceGroup -Name rb-$Site2code-$App-$Stage1code-sdisk-rg01 -Location $Site2 -Tag @{ App="$App";  Stage="$Stage1" }
New-AzureRmResourceGroup -Name rb-$Site3code-$App-$Stage1code-sdisk-rg01 -Location $Site3 -Tag @{ App="$App";  Stage="$Stage1" }
New-AzureRmResourceGroup -Name rb-$Site1code-$App-$Stage2code-sdisk-rg01 -Location $Site1 -Tag @{ App="$App";  Stage="$Stage2" }
New-AzureRmResourceGroup -Name rb-$Site2code-$App-$Stage2code-sdisk-rg01 -Location $Site2 -Tag @{ App="$App";  Stage="$Stage2" }
New-AzureRmResourceGroup -Name rb-$Site3code-$App-$Stage2code-sdisk-rg01 -Location $Site3 -Tag @{ App="$App";  Stage="$Stage2" }
New-AzureRmResourceGroup -Name rb-$Site1code-$App-$Stage1code-sdiag-rg01 -Location $Site1 -Tag @{ App="$App";  Stage="$Stage1" }
New-AzureRmResourceGroup -Name rb-$Site2code-$App-$Stage1code-sdiag-rg01 -Location $Site2 -Tag @{ App="$App";  Stage="$Stage1" }
New-AzureRmResourceGroup -Name rb-$Site3code-$App-$Stage1code-sdiag-rg01 -Location $Site3 -Tag @{ App="$App";  Stage="$Stage1" }
New-AzureRmResourceGroup -Name rb-$Site1code-$App-$Stage2code-sdiag-rg01 -Location $Site1 -Tag @{ App="$App";  Stage="$Stage2" }
New-AzureRmResourceGroup -Name rb-$Site2code-$App-$Stage2code-sdiag-rg01 -Location $Site2 -Tag @{ App="$App";  Stage="$Stage2" }
New-AzureRmResourceGroup -Name rb-$Site3code-$App-$Stage2code-sdiag-rg01 -Location $Site3 -Tag @{ App="$App";  Stage="$Stage2" }
New-AzureRmResourceGroup -Name rb-$Site1code-$App-$Stage1code-pipm-rg01 -Location $Site1 -Tag @{ App="$App";  Stage="$Stage1" }
New-AzureRmResourceGroup -Name rb-$Site2code-$App-$Stage1code-pipm-rg01 -Location $Site2 -Tag @{ App="$App";  Stage="$Stage1" }
New-AzureRmResourceGroup -Name rb-$Site3code-$App-$Stage1code-pipm-rg01 -Location $Site3 -Tag @{ App="$App";  Stage="$Stage1" }
New-AzureRmResourceGroup -Name rb-$Site1code-$App-$Stage2code-pipm-rg01 -Location $Site1 -Tag @{ App="$App";  Stage="$Stage2" }
New-AzureRmResourceGroup -Name rb-$Site2code-$App-$Stage2code-pipm-rg01 -Location $Site2 -Tag @{ App="$App";  Stage="$Stage2" }
New-AzureRmResourceGroup -Name rb-$Site3code-$App-$Stage2code-pipm-rg01 -Location $Site3 -Tag @{ App="$App";  Stage="$Stage2" }
New-AzureRmResourceGroup -Name rb-$Site1code-$App-$Stage1code-pipd-rg01 -Location $Site1 -Tag @{ App="$App";  Stage="$Stage1" }
New-AzureRmResourceGroup -Name rb-$Site2code-$App-$Stage1code-pipd-rg01 -Location $Site2 -Tag @{ App="$App";  Stage="$Stage1" }
New-AzureRmResourceGroup -Name rb-$Site3code-$App-$Stage1code-pipd-rg01 -Location $Site3 -Tag @{ App="$App";  Stage="$Stage1" }
New-AzureRmResourceGroup -Name rb-$Site1code-$App-$Stage2code-pipd-rg01 -Location $Site1 -Tag @{ App="$App";  Stage="$Stage2" }
New-AzureRmResourceGroup -Name rb-$Site2code-$App-$Stage2code-pipd-rg01 -Location $Site2 -Tag @{ App="$App";  Stage="$Stage2" }
New-AzureRmResourceGroup -Name rb-$Site3code-$App-$Stage2code-pipd-rg01 -Location $Site3 -Tag @{ App="$App";  Stage="$Stage2" }
New-AzureRmResourceGroup -Name rb-$Site1code-$App-$Stage1code-tstvm-rg01 -Location $Site1 -Tag @{ App="$App";  Stage="$Stage1" }
New-AzureRmResourceGroup -Name rb-$Site2code-$App-$Stage1code-tstvm-rg01 -Location $Site2 -Tag @{ App="$App";  Stage="$Stage1" }
New-AzureRmResourceGroup -Name rb-$Site3code-$App-$Stage1code-tstvm-rg01 -Location $Site3 -Tag @{ App="$App";  Stage="$Stage1" }
New-AzureRmResourceGroup -Name rb-$Site1code-$App-$Stage2code-tstvm-rg01 -Location $Site1 -Tag @{ App="$App";  Stage="$Stage2" }
New-AzureRmResourceGroup -Name rb-$Site2code-$App-$Stage2code-tstvm-rg01 -Location $Site2 -Tag @{ App="$App";  Stage="$Stage2" }
New-AzureRmResourceGroup -Name rb-$Site3code-$App-$Stage2code-tstvm-rg01 -Location $Site3 -Tag @{ App="$App";  Stage="$Stage2" }
New-AzureRmResourceGroup -Name rb-$Site1code-$App-$Stage1code-csrcr-rg01 -Location $Site1 -Tag @{ App="$App";  Stage="$Stage1" }
New-AzureRmResourceGroup -Name rb-$Site2code-$App-$Stage1code-csrcr-rg01 -Location $Site2 -Tag @{ App="$App";  Stage="$Stage1" }
New-AzureRmResourceGroup -Name rb-$Site3code-$App-$Stage1code-csrcr-rg01 -Location $Site3 -Tag @{ App="$App";  Stage="$Stage1" }
New-AzureRmResourceGroup -Name rb-$Site1code-$App-$Stage2code-csrcr-rg01 -Location $Site1 -Tag @{ App="$App";  Stage="$Stage2" }
New-AzureRmResourceGroup -Name rb-$Site2code-$App-$Stage2code-csrcr-rg01 -Location $Site2 -Tag @{ App="$App";  Stage="$Stage2" }
New-AzureRmResourceGroup -Name rb-$Site3code-$App-$Stage2code-csrcr-rg01 -Location $Site3 -Tag @{ App="$App";  Stage="$Stage2" }
New-AzureRmResourceGroup -Name rb-$Site1code-$App-$Stage1code-csrvm-rg101 -Location $Site1 -Tag @{ App="$App";  Stage="$Stage1" }
New-AzureRmResourceGroup -Name rb-$Site1code-$App-$Stage1code-csrvm-rg102 -Location $Site1 -Tag @{ App="$App";  Stage="$Stage1" }
New-AzureRmResourceGroup -Name rb-$Site2code-$App-$Stage1code-csrvm-rg101 -Location $Site2 -Tag @{ App="$App";  Stage="$Stage1" }
New-AzureRmResourceGroup -Name rb-$Site2code-$App-$Stage1code-csrvm-rg102 -Location $Site2 -Tag @{ App="$App";  Stage="$Stage1" }
New-AzureRmResourceGroup -Name rb-$Site3code-$App-$Stage1code-csrvm-rg101 -Location $Site3 -Tag @{ App="$App";  Stage="$Stage1" }
New-AzureRmResourceGroup -Name rb-$Site3code-$App-$Stage1code-csrvm-rg102 -Location $Site3 -Tag @{ App="$App";  Stage="$Stage1" }
New-AzureRmResourceGroup -Name rb-$Site1code-$App-$Stage2code-csrvm-rg101 -Location $Site1 -Tag @{ App="$App";  Stage="$Stage2" }
New-AzureRmResourceGroup -Name rb-$Site1code-$App-$Stage2code-csrvm-rg102 -Location $Site1 -Tag @{ App="$App";  Stage="$Stage2" }
New-AzureRmResourceGroup -Name rb-$Site2code-$App-$Stage2code-csrvm-rg101 -Location $Site2 -Tag @{ App="$App";  Stage="$Stage2" }
New-AzureRmResourceGroup -Name rb-$Site2code-$App-$Stage2code-csrvm-rg102 -Location $Site2 -Tag @{ App="$App";  Stage="$Stage2" }
New-AzureRmResourceGroup -Name rb-$Site3code-$App-$Stage2code-csrvm-rg101 -Location $Site3 -Tag @{ App="$App";  Stage="$Stage2" }
New-AzureRmResourceGroup -Name rb-$Site3code-$App-$Stage2code-csrvm-rg102 -Location $Site3 -Tag @{ App="$App";  Stage="$Stage2" } 