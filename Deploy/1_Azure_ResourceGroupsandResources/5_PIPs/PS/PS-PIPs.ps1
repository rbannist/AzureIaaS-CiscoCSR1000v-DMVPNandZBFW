$App = "AAA"
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
$Site1Stage1MPIPRG = "rb-$Site1code-$App-$Stage1code-pipm-rg01"
$Site2Stage1MPIPRG = "rb-$Site2code-$App-$Stage1code-pipm-rg01"
$Site3Stage1MPIPRG = "rb-$Site3code-$App-$Stage1code-pipm-rg01"
$Site1Stage2MPIPRG = "rb-$Site1code-$App-$Stage2code-pipm-rg01"
$Site2Stage2MPIPRG = "rb-$Site2code-$App-$Stage2code-pipm-rg01"
$Site3Stage2MPIPRG = "rb-$Site3code-$App-$Stage2code-pipm-rg01"
$Site1Stage1DPIPRG = "rb-$Site1code-$App-$Stage1code-pipd-rg01"
$Site2Stage1DPIPRG = "rb-$Site2code-$App-$Stage1code-pipd-rg01"
$Site3Stage1DPIPRG = "rb-$Site3code-$App-$Stage1code-pipd-rg01"
$Site1Stage2DPIPRG = "rb-$Site1code-$App-$Stage2code-pipd-rg01"
$Site2Stage2DPIPRG = "rb-$Site2code-$App-$Stage2code-pipd-rg01"
$Site3Stage2DPIPRG = "rb-$Site3code-$App-$Stage2code-pipd-rg01"
$Site1Stage1MPIP1 = "rb-$Site1code-$App-$Stage1code-pipm01"
$Site1Stage1MPIP2 = "rb-$Site1code-$App-$Stage1code-pipm02"
$Site2Stage1MPIP1 = "rb-$Site2code-$App-$Stage1code-pipm01"
$Site2Stage1MPIP2 = "rb-$Site2code-$App-$Stage1code-pipm02"
$Site3Stage1MPIP1 = "rb-$Site3code-$App-$Stage1code-pipm01"
$Site3Stage1MPIP2 = "rb-$Site3code-$App-$Stage1code-pipm02"
$Site1Stage2MPIP1 = "rb-$Site1code-$App-$Stage2code-pipm01"
$Site1Stage2MPIP2 = "rb-$Site1code-$App-$Stage2code-pipm02"
$Site2Stage2MPIP1 = "rb-$Site2code-$App-$Stage2code-pipm01"
$Site2Stage2MPIP2 = "rb-$Site2code-$App-$Stage2code-pipm02"
$Site3Stage2MPIP1 = "rb-$Site3code-$App-$Stage2code-pipm01"
$Site3Stage2MPIP2 = "rb-$Site3code-$App-$Stage2code-pipm02"
$Site1Stage1DPIP1 = "rb-$Site1code-$App-$Stage1code-pipd01"
$Site1Stage1DPIP2 = "rb-$Site1code-$App-$Stage1code-pipd02"
$Site2Stage1DPIP1 = "rb-$Site2code-$App-$Stage1code-pipd01"
$Site2Stage1DPIP2 = "rb-$Site2code-$App-$Stage1code-pipd02"
$Site3Stage1DPIP1 = "rb-$Site3code-$App-$Stage1code-pipd01"
$Site3Stage1DPIP2 = "rb-$Site3code-$App-$Stage1code-pipd02"
$Site1Stage2DPIP1 = "rb-$Site1code-$App-$Stage2code-pipd01"
$Site1Stage2DPIP2 = "rb-$Site1code-$App-$Stage2code-pipd02"
$Site2Stage2DPIP1 = "rb-$Site2code-$App-$Stage2code-pipd01"
$Site2Stage2DPIP2 = "rb-$Site2code-$App-$Stage2code-pipd02"
$Site3Stage2DPIP1 = "rb-$Site3code-$App-$Stage2code-pipd01"
$Site3Stage2DPIP2 = "rb-$Site3code-$App-$Stage2code-pipd02"


New-AzureRmPublicIpAddress -Name "$Site1Stage1MPIP1" -ResourceGroupName "$Site1Stage1MPIPRG" -AllocationMethod Dynamic -DomainNameLabel "$Site1Stage1MPIP1" -Location "$Site1" -Tag @{ App="$App";  Stage="$Stage1" }
New-AzureRmPublicIpAddress -Name "$Site1Stage1MPIP2" -ResourceGroupName "$Site1Stage1MPIPRG" -AllocationMethod Dynamic -DomainNameLabel "$Site1Stage1MPIP2" -Location "$Site1" -Tag @{ App="$App";  Stage="$Stage1" }
New-AzureRmPublicIpAddress -Name "$Site2Stage1MPIP1" -ResourceGroupName "$Site2Stage1MPIPRG" -AllocationMethod Dynamic -DomainNameLabel "$Site2Stage1MPIP1" -Location "$Site2" -Tag @{ App="$App";  Stage="$Stage1" }
New-AzureRmPublicIpAddress -Name "$Site2Stage1MPIP2" -ResourceGroupName "$Site2Stage1MPIPRG" -AllocationMethod Dynamic -DomainNameLabel "$Site2Stage1MPIP2" -Location "$Site2" -Tag @{ App="$App";  Stage="$Stage1" }
New-AzureRmPublicIpAddress -Name "$Site3Stage1MPIP1" -ResourceGroupName "$Site3Stage1MPIPRG" -AllocationMethod Dynamic -DomainNameLabel "$Site3Stage1MPIP1" -Location "$Site3" -Tag @{ App="$App";  Stage="$Stage1" }
New-AzureRmPublicIpAddress -Name "$Site3Stage1MPIP2" -ResourceGroupName "$Site3Stage1MPIPRG" -AllocationMethod Dynamic -DomainNameLabel "$Site3Stage1MPIP2" -Location "$Site3" -Tag @{ App="$App";  Stage="$Stage1" }
New-AzureRmPublicIpAddress -Name "$Site1Stage2MPIP1" -ResourceGroupName "$Site1Stage2MPIPRG" -AllocationMethod Dynamic -DomainNameLabel "$Site1Stage2MPIP1" -Location "$Site1" -Tag @{ App="$App";  Stage="$Stage2" }
New-AzureRmPublicIpAddress -Name "$Site1Stage2MPIP2" -ResourceGroupName "$Site1Stage2MPIPRG" -AllocationMethod Dynamic -DomainNameLabel "$Site1Stage2MPIP2" -Location "$Site1" -Tag @{ App="$App";  Stage="$Stage2" }
New-AzureRmPublicIpAddress -Name "$Site2Stage2MPIP1" -ResourceGroupName "$Site2Stage2MPIPRG" -AllocationMethod Dynamic -DomainNameLabel "$Site2Stage2MPIP1" -Location "$Site2" -Tag @{ App="$App";  Stage="$Stage2" }
New-AzureRmPublicIpAddress -Name "$Site2Stage2MPIP2" -ResourceGroupName "$Site2Stage2MPIPRG" -AllocationMethod Dynamic -DomainNameLabel "$Site2Stage2MPIP2" -Location "$Site2" -Tag @{ App="$App";  Stage="$Stage2" }
New-AzureRmPublicIpAddress -Name "$Site3Stage2MPIP1" -ResourceGroupName "$Site3Stage2MPIPRG" -AllocationMethod Dynamic -DomainNameLabel "$Site3Stage2MPIP1" -Location "$Site3" -Tag @{ App="$App";  Stage="$Stage2" }
New-AzureRmPublicIpAddress -Name "$Site3Stage2MPIP2" -ResourceGroupName "$Site3Stage2MPIPRG" -AllocationMethod Dynamic -DomainNameLabel "$Site3Stage2MPIP2" -Location "$Site3" -Tag @{ App="$App";  Stage="$Stage2" }
New-AzureRmPublicIpAddress -Name "$Site1Stage1DPIP1" -ResourceGroupName "$Site1Stage1DPIPRG" -AllocationMethod Static -DomainNameLabel "$Site1Stage1DPIP1" -Location "$Site1" -Tag @{ App="$App";  Stage="$Stage1" }
New-AzureRmPublicIpAddress -Name "$Site1Stage1DPIP2" -ResourceGroupName "$Site1Stage1DPIPRG" -AllocationMethod Static -DomainNameLabel "$Site1Stage1DPIP2" -Location "$Site1" -Tag @{ App="$App";  Stage="$Stage1" }
New-AzureRmPublicIpAddress -Name "$Site2Stage1DPIP1" -ResourceGroupName "$Site2Stage1DPIPRG" -AllocationMethod Static -DomainNameLabel "$Site2Stage1DPIP1" -Location "$Site2" -Tag @{ App="$App";  Stage="$Stage1" }
New-AzureRmPublicIpAddress -Name "$Site2Stage1DPIP2" -ResourceGroupName "$Site2Stage1DPIPRG" -AllocationMethod Static -DomainNameLabel "$Site2Stage1DPIP2" -Location "$Site2" -Tag @{ App="$App";  Stage="$Stage1" }
New-AzureRmPublicIpAddress -Name "$Site3Stage1DPIP1" -ResourceGroupName "$Site3Stage1DPIPRG" -AllocationMethod Static -DomainNameLabel "$Site3Stage1DPIP1" -Location "$Site3" -Tag @{ App="$App";  Stage="$Stage1" }
New-AzureRmPublicIpAddress -Name "$Site3Stage1DPIP2" -ResourceGroupName "$Site3Stage1DPIPRG" -AllocationMethod Static -DomainNameLabel "$Site3Stage1DPIP2" -Location "$Site3" -Tag @{ App="$App";  Stage="$Stage1" }
New-AzureRmPublicIpAddress -Name "$Site1Stage2DPIP1" -ResourceGroupName "$Site1Stage2DPIPRG" -AllocationMethod Static -DomainNameLabel "$Site1Stage2DPIP1" -Location "$Site1" -Tag @{ App="$App";  Stage="$Stage2" }
New-AzureRmPublicIpAddress -Name "$Site1Stage2DPIP2" -ResourceGroupName "$Site1Stage2DPIPRG" -AllocationMethod Static -DomainNameLabel "$Site1Stage2DPIP2" -Location "$Site1" -Tag @{ App="$App";  Stage="$Stage2" }
New-AzureRmPublicIpAddress -Name "$Site2Stage2DPIP1" -ResourceGroupName "$Site2Stage2DPIPRG" -AllocationMethod Static -DomainNameLabel "$Site2Stage2DPIP1" -Location "$Site2" -Tag @{ App="$App";  Stage="$Stage2" }
New-AzureRmPublicIpAddress -Name "$Site2Stage2DPIP2" -ResourceGroupName "$Site2Stage2DPIPRG" -AllocationMethod Static -DomainNameLabel "$Site2Stage2DPIP2" -Location "$Site2" -Tag @{ App="$App";  Stage="$Stage2" }
New-AzureRmPublicIpAddress -Name "$Site3Stage2DPIP1" -ResourceGroupName "$Site3Stage2DPIPRG" -AllocationMethod Static -DomainNameLabel "$Site3Stage2DPIP1" -Location "$Site3" -Tag @{ App="$App";  Stage="$Stage2" }
New-AzureRmPublicIpAddress -Name "$Site3Stage2DPIP2" -ResourceGroupName "$Site3Stage2DPIPRG" -AllocationMethod Static -DomainNameLabel "$Site3Stage2DPIP2" -Location "$Site3" -Tag @{ App="$App";  Stage="$Stage2" } 
