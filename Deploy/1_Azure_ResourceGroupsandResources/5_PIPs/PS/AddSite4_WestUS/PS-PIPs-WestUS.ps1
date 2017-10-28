$App = "AAA"
$Stage1 = "DevQA"
$Stage2 = "Prod"
$Stage1code = "dqa"
$Stage2code = "prod"
$Site4 = "westus"
$Site4code = "wus"
$Site4Stage1MPIPRG = "rb-$Site4code-$App-$Stage1code-pipm-rg01"
$Site4Stage2MPIPRG = "rb-$Site4code-$App-$Stage2code-pipm-rg01"
$Site4Stage1DPIPRG = "rb-$Site4code-$App-$Stage1code-pipd-rg01"
$Site4Stage2DPIPRG = "rb-$Site4code-$App-$Stage2code-pipd-rg01"
$Site4Stage1MPIP1 = "rb-$Site4code-$App-$Stage1code-pipm01"
$Site4Stage1MPIP2 = "rb-$Site4code-$App-$Stage1code-pipm02"
$Site4Stage2MPIP1 = "rb-$Site4code-$App-$Stage2code-pipm01"
$Site4Stage2MPIP2 = "rb-$Site4code-$App-$Stage2code-pipm02"
$Site4Stage1DPIP1 = "rb-$Site4code-$App-$Stage1code-pipd01"
$Site4Stage1DPIP2 = "rb-$Site4code-$App-$Stage1code-pipd02"
$Site4Stage2DPIP1 = "rb-$Site4code-$App-$Stage2code-pipd01"
$Site4Stage2DPIP2 = "rb-$Site4code-$App-$Stage2code-pipd02"


New-AzureRmPublicIpAddress -Name "$Site4Stage1MPIP1" -ResourceGroupName "$Site4Stage1MPIPRG" -AllocationMethod Dynamic -DomainNameLabel "$Site4Stage1MPIP1" -Location "$Site4" -Tag @{ App="$App";  Stage="$Stage1" }
New-AzureRmPublicIpAddress -Name "$Site4Stage1MPIP2" -ResourceGroupName "$Site4Stage1MPIPRG" -AllocationMethod Dynamic -DomainNameLabel "$Site4Stage1MPIP2" -Location "$Site4" -Tag @{ App="$App";  Stage="$Stage1" }
New-AzureRmPublicIpAddress -Name "$Site4Stage2MPIP1" -ResourceGroupName "$Site4Stage2MPIPRG" -AllocationMethod Dynamic -DomainNameLabel "$Site4Stage2MPIP1" -Location "$Site4" -Tag @{ App="$App";  Stage="$Stage2" }
New-AzureRmPublicIpAddress -Name "$Site4Stage2MPIP2" -ResourceGroupName "$Site4Stage2MPIPRG" -AllocationMethod Dynamic -DomainNameLabel "$Site4Stage2MPIP2" -Location "$Site4" -Tag @{ App="$App";  Stage="$Stage2" }
New-AzureRmPublicIpAddress -Name "$Site4Stage1DPIP1" -ResourceGroupName "$Site4Stage1DPIPRG" -AllocationMethod Static -DomainNameLabel "$Site4Stage1DPIP1" -Location "$Site4" -Tag @{ App="$App";  Stage="$Stage1" }
New-AzureRmPublicIpAddress -Name "$Site4Stage1DPIP2" -ResourceGroupName "$Site4Stage1DPIPRG" -AllocationMethod Static -DomainNameLabel "$Site4Stage1DPIP2" -Location "$Site4" -Tag @{ App="$App";  Stage="$Stage1" }
New-AzureRmPublicIpAddress -Name "$Site4Stage2DPIP1" -ResourceGroupName "$Site4Stage2DPIPRG" -AllocationMethod Static -DomainNameLabel "$Site4Stage2DPIP1" -Location "$Site4" -Tag @{ App="$App";  Stage="$Stage2" }
New-AzureRmPublicIpAddress -Name "$Site4Stage2DPIP2" -ResourceGroupName "$Site4Stage2DPIPRG" -AllocationMethod Static -DomainNameLabel "$Site4Stage2DPIP2" -Location "$Site4" -Tag @{ App="$App";  Stage="$Stage2" }
