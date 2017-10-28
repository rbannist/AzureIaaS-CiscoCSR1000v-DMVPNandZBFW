$$App = "AAA"
$Stage1 = "DevQA"
$Stage2 = "Prod"
$Stage1code = "dqa"
$Stage2code = "prod"
$Site4 = "westus"
$Site4code = "wus"
$Site4Stage1CRRG = "rb-$Site4code-$App-$Stage1code-csrcr-rg01"
$Site4Stage2CRRG = "rb-$Site4code-$App-$Stage2code-csrcr-rg01"
$Site4Stage1VNETName = "rb-$Site4code-$App-$Stage1code-vn01"
$Site4Stage2VNETName = "rb-$Site4code-$App-$Stage2code-vn01"
$Site4Stage1MgmtSubnetName = "rb-$Site4code-$App-$Stage1code-vn01-sn01"
$Site4Stage1OutsideSubnetName = "rb-$Site4code-$App-$Stage1code-vn01-sn02"
$Site4Stage1DMZSubnetName = "rb-$Site4code-$App-$Stage1code-vn01-sn03"
$Site4Stage1InsideSubnetName = "rb-$Site4code-$App-$Stage1code-vn01-sn04"
$Site4Stage2MgmtSubnetName = "rb-$Site4code-$App-$Stage2code-vn01-sn01"
$Site4Stage2OutsideSubnetName = "rb-$Site4code-$App-$Stage2code-vn01-sn02"
$Site4Stage2DMZSubnetName = "rb-$Site4code-$App-$Stage2code-vn01-sn03"
$Site4Stage2InsideSubnetName = "rb-$Site4code-$App-$Stage2code-vn01-sn04"
$Site4Stage1MgmtSubnetPrefix = "192.168.44.0/24"
$Site4Stage1OutsideSubnetPrefix = "192.168.45.0/24"
$Site4Stage1DMZSubnetPrefix = "192.168.46.0/24"
$Site4Stage1InsideSubnetPrefix = "192.168.47.0/24"
$Site4Stage2MgmtSubnetPrefix = "192.168.160.0/24"
$Site4Stage2OutsideSubnetPrefix = "192.168.161.0/24"
$Site4Stage2DMZSubnetPrefix = "192.168.162.0/24"
$Site4Stage2InsideSubnetPrefix = "192.168.163.0/24"
$Site4Stage1MgmtCSR1IP = "192.168.44.4"
$Site4Stage1OutsideCSR1IP = "192.168.45.4"
$Site4Stage1DMZCSR1IP = "192.168.46.4"
$Site4Stage1InsideCSR1IP = "192.168.47.4"
$Site4Stage2MgmtCSR1IP = "192.168.160.4"
$Site4Stage2OutsideCSR1IP = "192.168.161.4"
$Site4Stage2DMZCSR1IP = "192.168.162.4"
$Site4Stage2InsideCSR1IP = "192.168.163.4"
$Site4Stage1MgmtUDRName = "rb-$Site4code-$App-$Stage1code-udrvn01sn01"
$Site4Stage1OutsideUDRName = "rb-$Site4code-$App-$Stage1code-udrvn01sn02"
$Site4Stage1DMZUDRName = "rb-$Site4code-$App-$Stage1code-udrvn01sn03"
$Site4Stage1InsideUDRName = "rb-$Site4code-$App-$Stage1code-udrvn01sn04"
$Site4Stage2MgmtUDRName = "rb-$Site4code-$App-$Stage2code-udrvn01sn01"
$Site4Stage2OutsideUDRName = "rb-$Site4code-$App-$Stage2code-udrvn01sn02"
$Site4Stage2DMZUDRName = "rb-$Site4code-$App-$Stage2code-udrvn01sn03"
$Site4Stage2InsideUDRName = "rb-$Site4code-$App-$Stage2code-udrvn01sn04"
$routeVN1SN2NullonVN1SN1Name = "route-VN1SN1-Null"
$routeVN1SN2NullonVN1SN1Name = "route-VN1SN2-Null"
$routeVN1SN3NullonVN1SN1Name = "route-VN1SN3-Null"
$routeVN1SN4NullonVN1SN1Name = "route-VN1SN4-Null"
$routeDefault0CSRGi3onVN1SN3Name = "route-Default0-CSR-Gi3"
$routeVN1SN2CSRGi3onVN1SN3Name = "route-VN1SN2-CSR-Gi3"
$routeVN1SN4CSRGi3onVN1SN3Name = "route-VN1SN4-CSR-Gi3"
$routeDefault0CSRGi4onVN1SN4Name = "route-Default0-CSR-Gi4"
$routeVN1SN3CSRGi4onVN1SN4Name = "route-VN1SN3-CSR-Gi4"
$routeVN1SN4CSRGi4onVN1SN4Name = "route-VN1SN4-CSR-Gi4"



$Site4Stage1MgmtUDRPSOut = New-AzureRmRouteTable -ResourceGroupName "$Site4Stage1CRRG" -Location "$Site4" -Name "$Site4Stage1MgmtUDRName" -Tag @{ App="$App";  Stage="$Stage1" }
$Site4Stage1VNETPSOut = Get-AzureRmVirtualNetwork -ResourceGroupName "$Site4Stage1CRRG" -Name "$Site4Stage1VNETName"
$Site4Stage1MgmtSubnetPSOut = Set-AzureRmVirtualNetworkSubnetConfig -VirtualNetwork $Site4Stage1VNETPSOut -Name "$Site4Stage1MgmtSubnetName" -AddressPrefix "$Site4Stage1MgmtSubnetPrefix" -RouteTable $Site4Stage1MgmtUDRPSOut
Set-AzureRmVirtualNetwork -VirtualNetwork $Site4Stage1MgmtSubnetPSOut
Add-AzureRmRouteConfig -Name "$routeVN1SN2NullonVN1SN1Name" -AddressPrefix "$Site4Stage1OutsideSubnetPrefix" -RouteTable $Site4Stage1MgmtUDRPSOut -NextHopType None
Add-AzureRmRouteConfig -Name "$routeVN1SN3NullonVN1SN1Name" -AddressPrefix "$Site4Stage1DMZSubnetPrefix" -RouteTable $Site4Stage1MgmtUDRPSOut -NextHopType None
Add-AzureRmRouteConfig -Name "$routeVN1SN4NullonVN1SN1Name" -AddressPrefix "$Site4Stage1InsideSubnetPrefix" -RouteTable $Site4Stage1MgmtUDRPSOut -NextHopType None
Set-AzureRmRouteTable -RouteTable $Site4Stage1MgmtUDRPSOut

$Site4Stage1OutsideUDRPSOut = New-AzureRmRouteTable -ResourceGroupName "$Site4Stage1CRRG" -Location "$Site4" -Name "$Site4Stage1OutsideUDRName" -Tag @{ App="$App";  Stage="$Stage1" }
$Site4Stage1VNETPSOut = Get-AzureRmVirtualNetwork -ResourceGroupName "$Site4Stage1CRRG" -Name "$Site4Stage1VNETName"
$Site4Stage1OutsideSubnetPSOut = Set-AzureRmVirtualNetworkSubnetConfig -VirtualNetwork $Site4Stage1VNETPSOut -Name "$Site4Stage1OutsideSubnetName" -AddressPrefix "$Site4Stage1OutsideSubnetPrefix" -RouteTable $Site4Stage1OutsideUDRPSOut
Set-AzureRmVirtualNetwork -VirtualNetwork $Site4Stage1OutsideSubnetPSOut

$Site4Stage1DMZUDRPSOut = New-AzureRmRouteTable -ResourceGroupName "$Site4Stage1CRRG" -Location "$Site4" -Name "$Site4Stage1DMZUDRName" -Tag @{ App="$App";  Stage="$Stage1" }
$Site4Stage1VNETPSOut = Get-AzureRmVirtualNetwork -ResourceGroupName "$Site4Stage1CRRG" -Name "$Site4Stage1VNETName"
$Site4Stage1DMZSubnetPSOut = Set-AzureRmVirtualNetworkSubnetConfig -VirtualNetwork $Site4Stage1VNETPSOut -Name "$Site4Stage1DMZSubnetName" -AddressPrefix "$Site4Stage1DMZSubnetPrefix" -RouteTable $Site4Stage1DMZUDRPSOut
Set-AzureRmVirtualNetwork -VirtualNetwork $Site4Stage1DMZSubnetPSOut
Add-AzureRmRouteConfig -Name "$routeDefault0CSRGi3onVN1SN3Name" -AddressPrefix 0.0.0.0/0 -RouteTable $Site4Stage1DMZUDRPSOut -NextHopType VirtualAppliance -NextHopIpAddress "$Site4Stage1DMZCSR1IP"
Add-AzureRmRouteConfig -Name "$routeVN1SN2CSRGi3onVN1SN3Name" -AddressPrefix "$Site4Stage1OutsideSubnetPrefix" -RouteTable $Site4Stage1DMZUDRPSOut -NextHopType VirtualAppliance -NextHopIpAddress "$Site4Stage1DMZCSR1IP"
Add-AzureRmRouteConfig -Name "$routeVN1SN4CSRGi3onVN1SN3Name" -AddressPrefix "$Site4Stage1InsideSubnetPrefix" -RouteTable $Site4Stage1DMZUDRPSOut -NextHopType VirtualAppliance -NextHopIpAddress "$Site4Stage1DMZCSR1IP"
Set-AzureRmRouteTable -RouteTable $Site4Stage1DMZUDRPSOut

$Site4Stage1InsideUDRPSOut = New-AzureRmRouteTable -ResourceGroupName "$Site4Stage1CRRG" -Location "$Site4" -Name "$Site4Stage1InsideUDRName" -Tag @{ App="$App";  Stage="$Stage1" }
$Site4Stage1VNETPSOut = Get-AzureRmVirtualNetwork -ResourceGroupName "$Site4Stage1CRRG" -Name "$Site4Stage1VNETName"
$Site4Stage1InsideSubnetPSOut = Set-AzureRmVirtualNetworkSubnetConfig -VirtualNetwork $Site4Stage1VNETPSOut -Name "$Site4Stage1InsideSubnetName" -AddressPrefix "$Site4Stage1InsideSubnetPrefix" -RouteTable $Site4Stage1InsideUDRPSOut
Set-AzureRmVirtualNetwork -VirtualNetwork $Site4Stage1InsideSubnetPSOut
Add-AzureRmRouteConfig -Name "$routeDefault0CSRGi4onVN1SN4Name" -AddressPrefix 0.0.0.0/0 -RouteTable $Site4Stage1InsideUDRPSOut -NextHopType VirtualAppliance -NextHopIpAddress "$Site4Stage1InsideCSR1IP"
Add-AzureRmRouteConfig -Name "$routeVN1SN3CSRGi4onVN1SN4Name" -AddressPrefix "$Site4Stage1OutsideSubnetPrefix" -RouteTable $Site4Stage1InsideUDRPSOut -NextHopType VirtualAppliance -NextHopIpAddress "$Site4Stage1InsideCSR1IP"
Add-AzureRmRouteConfig -Name "$routeVN1SN4CSRGi4onVN1SN4Name" -AddressPrefix "$Site4Stage1DMZSubnetPrefix" -RouteTable $Site4Stage1InsideUDRPSOut -NextHopType VirtualAppliance -NextHopIpAddress "$Site4Stage1InsideCSR1IP"
Set-AzureRmRouteTable -RouteTable $Site4Stage1InsideUDRPSOut 

$Site4Stage2MgmtUDRPSOut = New-AzureRmRouteTable -ResourceGroupName "$Site4Stage2CRRG" -Location "$Site4" -Name "$Site4Stage2MgmtUDRName" -Tag @{ App="$App";  Stage="$Stage2" }
$Site4Stage2VNETPSOut = Get-AzureRmVirtualNetwork -ResourceGroupName "$Site4Stage2CRRG" -Name "$Site4Stage2VNETName"
$Site4Stage2MgmtSubnetPSOut = Set-AzureRmVirtualNetworkSubnetConfig -VirtualNetwork $Site4Stage2VNETPSOut -Name "$Site4Stage2MgmtSubnetName" -AddressPrefix "$Site4Stage2MgmtSubnetPrefix" -RouteTable $Site4Stage2MgmtUDRPSOut
Set-AzureRmVirtualNetwork -VirtualNetwork $Site4Stage2MgmtSubnetPSOut
Add-AzureRmRouteConfig -Name "$routeVN1SN2NullonVN1SN1Name" -AddressPrefix "$Site4Stage2OutsideSubnetPrefix" -RouteTable $Site4Stage2MgmtUDRPSOut -NextHopType None
Add-AzureRmRouteConfig -Name "$routeVN1SN3NullonVN1SN1Name" -AddressPrefix "$Site4Stage2DMZSubnetPrefix" -RouteTable $Site4Stage2MgmtUDRPSOut -NextHopType None
Add-AzureRmRouteConfig -Name "$routeVN1SN4NullonVN1SN1Name" -AddressPrefix "$Site4Stage2InsideSubnetPrefix" -RouteTable $Site4Stage2MgmtUDRPSOut -NextHopType None
Set-AzureRmRouteTable -RouteTable $Site4Stage2MgmtUDRPSOut

$Site4Stage2OutsideUDRPSOut = New-AzureRmRouteTable -ResourceGroupName "$Site4Stage2CRRG" -Location "$Site4" -Name "$Site4Stage2OutsideUDRName" -Tag @{ App="$App";  Stage="$Stage2" }
$Site4Stage2VNETPSOut = Get-AzureRmVirtualNetwork -ResourceGroupName "$Site4Stage2CRRG" -Name "$Site4Stage2VNETName"
$Site4Stage2OutsideSubnetPSOut = Set-AzureRmVirtualNetworkSubnetConfig -VirtualNetwork $Site4Stage2VNETPSOut -Name "$Site4Stage2OutsideSubnetName" -AddressPrefix "$Site4Stage2OutsideSubnetPrefix" -RouteTable $Site4Stage2OutsideUDRPSOut
Set-AzureRmVirtualNetwork -VirtualNetwork $Site4Stage2OutsideSubnetPSOut

$Site4Stage2DMZUDRPSOut = New-AzureRmRouteTable -ResourceGroupName "$Site4Stage2CRRG" -Location "$Site4" -Name "$Site4Stage2DMZUDRName" -Tag @{ App="$App";  Stage="$Stage2" }
$Site4Stage2VNETPSOut = Get-AzureRmVirtualNetwork -ResourceGroupName "$Site4Stage2CRRG" -Name "$Site4Stage2VNETName"
$Site4Stage2DMZSubnetPSOut = Set-AzureRmVirtualNetworkSubnetConfig -VirtualNetwork $Site4Stage2VNETPSOut -Name "$Site4Stage2DMZSubnetName" -AddressPrefix "$Site4Stage2DMZSubnetPrefix" -RouteTable $Site4Stage2DMZUDRPSOut
Set-AzureRmVirtualNetwork -VirtualNetwork $Site4Stage2DMZSubnetPSOut
Add-AzureRmRouteConfig -Name "$routeDefault0CSRGi3onVN1SN3Name" -AddressPrefix 0.0.0.0/0 -RouteTable $Site4Stage2DMZUDRPSOut -NextHopType VirtualAppliance -NextHopIpAddress "$Site4Stage2DMZCSR1IP"
Add-AzureRmRouteConfig -Name "$routeVN1SN2CSRGi3onVN1SN3Name" -AddressPrefix "$Site4Stage2OutsideSubnetPrefix" -RouteTable $Site4Stage2DMZUDRPSOut -NextHopType VirtualAppliance -NextHopIpAddress "$Site4Stage2DMZCSR1IP"
Add-AzureRmRouteConfig -Name "$routeVN1SN4CSRGi3onVN1SN3Name" -AddressPrefix "$Site4Stage2InsideSubnetPrefix" -RouteTable $Site4Stage2DMZUDRPSOut -NextHopType VirtualAppliance -NextHopIpAddress "$Site4Stage2DMZCSR1IP"
Set-AzureRmRouteTable -RouteTable $Site4Stage2DMZUDRPSOut

$Site4Stage2InsideUDRPSOut = New-AzureRmRouteTable -ResourceGroupName "$Site4Stage2CRRG" -Location "$Site4" -Name "$Site4Stage2InsideUDRName" -Tag @{ App="$App";  Stage="$Stage2" }
$Site4Stage2VNETPSOut = Get-AzureRmVirtualNetwork -ResourceGroupName "$Site4Stage2CRRG" -Name "$Site4Stage2VNETName"
$Site4Stage2InsideSubnetPSOut = Set-AzureRmVirtualNetworkSubnetConfig -VirtualNetwork $Site4Stage2VNETPSOut -Name "$Site4Stage2InsideSubnetName" -AddressPrefix "$Site4Stage2InsideSubnetPrefix" -RouteTable $Site4Stage2InsideUDRPSOut
Set-AzureRmVirtualNetwork -VirtualNetwork $Site4Stage2InsideSubnetPSOut
Add-AzureRmRouteConfig -Name "$routeDefault0CSRGi4onVN1SN4Name" -AddressPrefix 0.0.0.0/0 -RouteTable $Site4Stage2InsideUDRPSOut -NextHopType VirtualAppliance -NextHopIpAddress "$Site4Stage2InsideCSR1IP"
Add-AzureRmRouteConfig -Name "$routeVN1SN3CSRGi4onVN1SN4Name" -AddressPrefix "$Site4Stage2OutsideSubnetPrefix" -RouteTable $Site4Stage2InsideUDRPSOut -NextHopType VirtualAppliance -NextHopIpAddress "$Site4Stage2InsideCSR1IP"
Add-AzureRmRouteConfig -Name "$routeVN1SN4CSRGi4onVN1SN4Name" -AddressPrefix "$Site4Stage2DMZSubnetPrefix" -RouteTable $Site4Stage2InsideUDRPSOut -NextHopType VirtualAppliance -NextHopIpAddress "$Site4Stage2InsideCSR1IP"
Set-AzureRmRouteTable -RouteTable $Site4Stage2InsideUDRPSOut 
