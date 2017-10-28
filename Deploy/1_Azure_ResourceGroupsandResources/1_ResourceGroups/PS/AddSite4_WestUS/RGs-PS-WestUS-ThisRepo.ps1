$$App = "AAA"
$Stage1 = "DevQA"
$Stage1 = "Prod"
$Stage1code = "dqa"
$Stage2code = "prod"
$Site4 = "westus"
$Site4code = "wus"

New-AzureRmResourceGroup -Name rb-$Site4code-$App-$Stage1code-sdisk-rg01 -Location $Site4 -Tag @{ App="$App";  Stage="$Stage1" }
New-AzureRmResourceGroup -Name rb-$Site4code-$App-$Stage2code-sdisk-rg01 -Location $Site4 -Tag @{ App="$App";  Stage="$Stage2" }
New-AzureRmResourceGroup -Name rb-$Site4code-$App-$Stage1code-sdiag-rg01 -Location $Site4 -Tag @{ App="$App";  Stage="$Stage1" }
New-AzureRmResourceGroup -Name rb-$Site4code-$App-$Stage2code-sdiag-rg01 -Location $Site4 -Tag @{ App="$App";  Stage="$Stage2" }
New-AzureRmResourceGroup -Name rb-$Site4code-$App-$Stage1code-pipm-rg01 -Location $Site4 -Tag @{ App="$App";  Stage="$Stage1" }
New-AzureRmResourceGroup -Name rb-$Site4code-$App-$Stage2code-pipm-rg01 -Location $Site4 -Tag @{ App="$App";  Stage="$Stage2" }
New-AzureRmResourceGroup -Name rb-$Site4code-$App-$Stage1code-pipd-rg01 -Location $Site4 -Tag @{ App="$App";  Stage="$Stage1" }
New-AzureRmResourceGroup -Name rb-$Site4code-$App-$Stage2code-pipd-rg01 -Location $Site4 -Tag @{ App="$App";  Stage="$Stage2" }
New-AzureRmResourceGroup -Name rb-$Site4code-$App-$Stage1code-tstvm-rg01 -Location $Site4 -Tag @{ App="$App";  Stage="$Stage1" }
New-AzureRmResourceGroup -Name rb-$Site4code-$App-$Stage2code-tstvm-rg01 -Location $Site4 -Tag @{ App="$App";  Stage="$Stage2" }
New-AzureRmResourceGroup -Name rb-$Site4code-$App-$Stage1code-csrcr-rg01 -Location $Site4 -Tag @{ App="$App";  Stage="$Stage1" }
New-AzureRmResourceGroup -Name rb-$Site4code-$App-$Stage2code-csrcr-rg01 -Location $Site4 -Tag @{ App="$App";  Stage="$Stage2" }

New-AzureRmResourceGroup -Name rb-$Site4code-$App-$Stage1code-csrvm-rg01 -Location $Site4 -Tag @{ App="$App";  Stage="$Stage1" }
New-AzureRmResourceGroup -Name rb-$Site4code-$App-$Stage2code-csrvm-rg01 -Location $Site4 -Tag @{ App="$App";  Stage="$Stage2" }
