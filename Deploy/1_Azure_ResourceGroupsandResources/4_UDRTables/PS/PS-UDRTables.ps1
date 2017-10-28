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
$Site1Stage1CRRG = "rb-$Site1code-$Appcode-$Stage1code-csrcr-rg01"
$Site2Stage1CRRG = "rb-$Site2code-$Appcode-$Stage1code-csrcr-rg01"
$Site3Stage1CRRG = "rb-$Site3code-$Appcode-$Stage1code-csrcr-rg01"
$Site1Stage2CRRG = "rb-$Site1code-$Appcode-$Stage2code-csrcr-rg01"
$Site2Stage2CRRG = "rb-$Site2code-$Appcode-$Stage2code-csrcr-rg01"
$Site3Stage2CRRG = "rb-$Site3code-$Appcode-$Stage2code-csrcr-rg01"
$Site1Stage1VNETName = "rb-$Site1code-$Appcode-$Stage1code-vn01"
$Site2Stage1VNETName = "rb-$Site2code-$Appcode-$Stage1code-vn01"
$Site3Stage1VNETName = "rb-$Site3code-$Appcode-$Stage1code-vn01"
$Site1Stage2VNETName = "rb-$Site1code-$Appcode-$Stage2code-vn01"
$Site2Stage2VNETName = "rb-$Site2code-$Appcode-$Stage2code-vn01"
$Site3Stage2VNETName = "rb-$Site3code-$Appcode-$Stage2code-vn01"
$Site1Stage1MgmtSubnetName = "rb-$Site1code-$Appcode-$Stage1code-vn01-sn01"
$Site1Stage1OutsideSubnetName = "rb-$Site1code-$Appcode-$Stage1code-vn01-sn02"
$Site1Stage1DMZSubnetName = "rb-$Site1code-$Appcode-$Stage1code-vn01-sn03"
$Site1Stage1InsideSubnetName = "rb-$Site1code-$Appcode-$Stage1code-vn01-sn04"
$Site1Stage2MgmtSubnetName = "rb-$Site1code-$Appcode-$Stage2code-vn01-sn01"
$Site1Stage2OutsideSubnetName = "rb-$Site1code-$Appcode-$Stage2code-vn01-sn02"
$Site1Stage2DMZSubnetName = "rb-$Site1code-$Appcode-$Stage2code-vn01-sn03"
$Site1Stage2InsideSubnetName = "rb-$Site1code-$Appcode-$Stage2code-vn01-sn04"
$Site2Stage1MgmtSubnetName = "rb-$Site2code-$Appcode-$Stage1code-vn01-sn01"
$Site2Stage1OutsideSubnetName = "rb-$Site2code-$Appcode-$Stage1code-vn01-sn02"
$Site2Stage1DMZSubnetName = "rb-$Site2code-$Appcode-$Stage1code-vn01-sn03"
$Site2Stage1InsideSubnetName = "rb-$Site2code-$Appcode-$Stage1code-vn01-sn04"
$Site2Stage2MgmtSubnetName = "rb-$Site2code-$Appcode-$Stage2code-vn01-sn01"
$Site2Stage2OutsideSubnetName = "rb-$Site2code-$Appcode-$Stage2code-vn01-sn02"
$Site2Stage2DMZSubnetName = "rb-$Site2code-$Appcode-$Stage2code-vn01-sn03"
$Site2Stage2InsideSubnetName = "rb-$Site2code-$Appcode-$Stage2code-vn01-sn04"
$Site3Stage1MgmtSubnetName = "rb-$Site3code-$Appcode-$Stage1code-vn01-sn01"
$Site3Stage1OutsideSubnetName = "rb-$Site3code-$Appcode-$Stage1code-vn01-sn02"
$Site3Stage1DMZSubnetName = "rb-$Site3code-$Appcode-$Stage1code-vn01-sn03"
$Site3Stage1InsideSubnetName = "rb-$Site3code-$Appcode-$Stage1code-vn01-sn04"
$Site3Stage2MgmtSubnetName = "rb-$Site3code-$Appcode-$Stage2code-vn01-sn01"
$Site3Stage2OutsideSubnetName = "rb-$Site3code-$Appcode-$Stage2code-vn01-sn02"
$Site3Stage2DMZSubnetName = "rb-$Site3code-$Appcode-$Stage2code-vn01-sn03"
$Site3Stage2InsideSubnetName = "rb-$Site3code-$Appcode-$Stage2code-vn01-sn04"
$Site1Stage1MgmtSubnetPrefix = "192.168.0.0/24"
$Site1Stage1OutsideSubnetPrefix = "192.168.1.0/24"
$Site1Stage1DMZSubnetPrefix = "192.168.2.0/24"
$Site1Stage1InsideSubnetPrefix = "192.168.3.0/24"
$Site1Stage2MgmtSubnetPrefix = "192.168.112.0/24"
$Site1Stage2OutsideSubnetPrefix = "192.168.113.0/24"
$Site1Stage2DMZSubnetPrefix = "192.168.114.0/24"
$Site1Stage2InsideSubnetPrefix = "192.168.115.0/24"
$Site2Stage1MgmtSubnetPrefix = "192.168.16.0/24"
$Site2Stage1OutsideSubnetPrefix = "192.168.17.0/24"
$Site2Stage1DMZSubnetPrefix = "192.168.18.0/24"
$Site2Stage1InsideSubnetPrefix = "192.168.19.0/24"
$Site2Stage2MgmtSubnetPrefix = "192.168.128.0/24"
$Site2Stage2OutsideSubnetPrefix = "192.168.129.0/24"
$Site2Stage2DMZSubnetPrefix = "192.168.130.0/24"
$Site2Stage2InsideSubnetPrefix = "192.168.131.0/24"
$Site3Stage1MgmtSubnetPrefix = "192.168.32.0/24"
$Site3Stage1OutsideSubnetPrefix = "192.168.33.0/24"
$Site3Stage1DMZSubnetPrefix = "192.168.34.0/24"
$Site3Stage1InsideSubnetPrefix = "192.168.35.0/24"
$Site3Stage2MgmtSubnetPrefix = "192.168.144.0/24"
$Site3Stage2OutsideSubnetPrefix = "192.168.145.0/24"
$Site3Stage2DMZSubnetPrefix = "192.168.146.0/24"
$Site3Stage2InsideSubnetPrefix = "192.168.147.0/24"
$Site1Stage1MgmtCSR1IP = "192.168.0.4"
$Site1Stage1OutsideCSR1IP = "192.168.1.4"
$Site1Stage1DMZCSR1IP = "192.168.2.4"
$Site1Stage1InsideCSR1IP = "192.168.3.4"
$Site1Stage2MgmtCSR1IP = "192.168.112.4"
$Site1Stage2OutsideCSR1IP = "192.168.113.4"
$Site1Stage2DMZCSR1IP = "192.168.114.4"
$Site1Stage2InsideCSR1IP = "192.168.115.4"
$Site2Stage1MgmtCSR1IP = "192.168.16.4"
$Site2Stage1OutsideCSR1IP = "192.168.17.4"
$Site2Stage1DMZCSR1IP = "192.168.18.4"
$Site2Stage1InsideCSR1IP = "192.168.19.4"
$Site2Stage2MgmtCSR1IP = "192.168.128.4"
$Site2Stage2OutsideCSR1IP = "192.168.129.4"
$Site2Stage2DMZCSR1IP = "192.168.130.4"
$Site2Stage2InsideCSR1IP = "192.168.131.4"
$Site3Stage1MgmtCSR1IP = "192.168.32.4"
$Site3Stage1OutsideCSR1IP = "192.168.33.4"
$Site3Stage1DMZCSR1IP = "192.168.34.4"
$Site3Stage1InsideCSR1IP = "192.168.35.4"
$Site3Stage2MgmtCSR1IP = "192.168.144.4"
$Site3Stage2OutsideCSR1IP = "192.168.145.4"
$Site3Stage2DMZCSR1IP = "192.168.146.4"
$Site3Stage2InsideCSR1IP = "192.168.147.4"
$Site1Stage1MgmtUDRName = "rb-$Site1code-$Appcode-$Stage1code-udrvn01sn01"
$Site1Stage1OutsideUDRName = "rb-$Site1code-$Appcode-$Stage1code-udrvn01sn02"
$Site1Stage1DMZUDRName = "rb-$Site1code-$Appcode-$Stage1code-udrvn01sn03"
$Site1Stage1InsideUDRName = "rb-$Site1code-$Appcode-$Stage1code-udrvn01sn04"
$Site1Stage2MgmtUDRName = "rb-$Site1code-$Appcode-$Stage2code-udrvn01sn01"
$Site1Stage2OutsideUDRName = "rb-$Site1code-$Appcode-$Stage2code-udrvn01sn02"
$Site1Stage2DMZUDRName = "rb-$Site1code-$Appcode-$Stage2code-udrvn01sn03"
$Site1Stage2InsideUDRName = "rb-$Site1code-$Appcode-$Stage2code-udrvn01sn04"
$Site2Stage1MgmtUDRName = "rb-$Site2code-$Appcode-$Stage1code-udrvn01sn01"
$Site2Stage1OutsideUDRName = "rb-$Site2code-$Appcode-$Stage1code-udrvn01sn02"
$Site2Stage1DMZUDRName = "rb-$Site2code-$Appcode-$Stage1code-udrvn01sn03"
$Site2Stage1InsideUDRName = "rb-$Site2code-$Appcode-$Stage1code-udrvn01sn04"
$Site2Stage2MgmtUDRName = "rb-$Site2code-$Appcode-$Stage2code-udrvn01sn01"
$Site2Stage2OutsideUDRName = "rb-$Site2code-$Appcode-$Stage2code-udrvn01sn02"
$Site2Stage2DMZUDRName = "rb-$Site2code-$Appcode-$Stage2code-udrvn01sn03"
$Site2Stage2InsideUDRName = "rb-$Site2code-$Appcode-$Stage2code-udrvn01sn04"
$Site3Stage1MgmtUDRName = "rb-$Site3code-$Appcode-$Stage1code-udrvn01sn01"
$Site3Stage1OutsideUDRName = "rb-$Site3code-$Appcode-$Stage1code-udrvn01sn02"
$Site3Stage1DMZUDRName = "rb-$Site3code-$Appcode-$Stage1code-udrvn01sn03"
$Site3Stage1InsideUDRName = "rb-$Site3code-$Appcode-$Stage1code-udrvn01sn04"
$Site3Stage2MgmtUDRName = "rb-$Site3code-$Appcode-$Stage2code-udrvn01sn01"
$Site3Stage2OutsideUDRName = "rb-$Site3code-$Appcode-$Stage2code-udrvn01sn02"
$Site3Stage2DMZUDRName = "rb-$Site3code-$Appcode-$Stage2code-udrvn01sn03"
$Site3Stage2InsideUDRName = "rb-$Site3code-$Appcode-$Stage2code-udrvn01sn04"
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


$Site1Stage1MgmtUDRPSOut = New-AzureRmRouteTable -ResourceGroupName "$Site1Stage1CRRG" -Location "$Site1" -Name "$Site1Stage1MgmtUDRName" -Tag @{ App="$App";  Stage="$Stage1" }
$Site1Stage1VNETPSOut = Get-AzureRmVirtualNetwork -ResourceGroupName "$Site1Stage1CRRG" -Name "$Site1Stage1VNETName"
$Site1Stage1MgmtSubnetPSOut = Set-AzureRmVirtualNetworkSubnetConfig -VirtualNetwork $Site1Stage1VNETPSOut -Name "$Site1Stage1MgmtSubnetName" -AddressPrefix "$Site1Stage1MgmtSubnetPrefix" -RouteTable $Site1Stage1MgmtUDRPSOut
Set-AzureRmVirtualNetwork -VirtualNetwork $Site1Stage1MgmtSubnetPSOut
Add-AzureRmRouteConfig -Name "$routeVN1SN2NullonVN1SN1Name" -AddressPrefix "$Site1Stage1OutsideSubnetPrefix" -RouteTable $Site1Stage1MgmtUDRPSOut -NextHopType None
Add-AzureRmRouteConfig -Name "$routeVN1SN3NullonVN1SN1Name" -AddressPrefix "$Site1Stage1DMZSubnetPrefix" -RouteTable $Site1Stage1MgmtUDRPSOut -NextHopType None
Add-AzureRmRouteConfig -Name "$routeVN1SN4NullonVN1SN1Name" -AddressPrefix "$Site1Stage1InsideSubnetPrefix" -RouteTable $Site1Stage1MgmtUDRPSOut -NextHopType None
Set-AzureRmRouteTable -RouteTable $Site1Stage1MgmtUDRPSOut

$Site1Stage1OutsideUDRPSOut = New-AzureRmRouteTable -ResourceGroupName "$Site1Stage1CRRG" -Location "$Site1" -Name "$Site1Stage1OutsideUDRName" -Tag @{ App="$App";  Stage="$Stage1" }
$Site1Stage1VNETPSOut = Get-AzureRmVirtualNetwork -ResourceGroupName "$Site1Stage1CRRG" -Name "$Site1Stage1VNETName"
$Site1Stage1OutsideSubnetPSOut = Set-AzureRmVirtualNetworkSubnetConfig -VirtualNetwork $Site1Stage1VNETPSOut -Name "$Site1Stage1OutsideSubnetName" -AddressPrefix "$Site1Stage1OutsideSubnetPrefix" -RouteTable $Site1Stage1OutsideUDRPSOut
Set-AzureRmVirtualNetwork -VirtualNetwork $Site1Stage1OutsideSubnetPSOut

$Site1Stage1DMZUDRPSOut = New-AzureRmRouteTable -ResourceGroupName "$Site1Stage1CRRG" -Location "$Site1" -Name "$Site1Stage1DMZUDRName" -Tag @{ App="$App";  Stage="$Stage1" }
$Site1Stage1VNETPSOut = Get-AzureRmVirtualNetwork -ResourceGroupName "$Site1Stage1CRRG" -Name "$Site1Stage1VNETName"
$Site1Stage1DMZSubnetPSOut = Set-AzureRmVirtualNetworkSubnetConfig -VirtualNetwork $Site1Stage1VNETPSOut -Name "$Site1Stage1DMZSubnetName" -AddressPrefix "$Site1Stage1DMZSubnetPrefix" -RouteTable $Site1Stage1DMZUDRPSOut
Set-AzureRmVirtualNetwork -VirtualNetwork $Site1Stage1DMZSubnetPSOut
Add-AzureRmRouteConfig -Name "$routeDefault0CSRGi3onVN1SN3Name" -AddressPrefix 0.0.0.0/0 -RouteTable $Site1Stage1DMZUDRPSOut -NextHopType VirtualAppliance -NextHopIpAddress "$Site1Stage1DMZCSR1IP"
Add-AzureRmRouteConfig -Name "$routeVN1SN2CSRGi3onVN1SN3Name" -AddressPrefix "$Site1Stage1OutsideSubnetPrefix" -RouteTable $Site1Stage1DMZUDRPSOut -NextHopType VirtualAppliance -NextHopIpAddress "$Site1Stage1DMZCSR1IP"
Add-AzureRmRouteConfig -Name "$routeVN1SN4CSRGi3onVN1SN3Name" -AddressPrefix "$Site1Stage1InsideSubnetPrefix" -RouteTable $Site1Stage1DMZUDRPSOut -NextHopType VirtualAppliance -NextHopIpAddress "$Site1Stage1DMZCSR1IP"
Set-AzureRmRouteTable -RouteTable $Site1Stage1DMZUDRPSOut

$Site1Stage1InsideUDRPSOut = New-AzureRmRouteTable -ResourceGroupName "$Site1Stage1CRRG" -Location "$Site1" -Name "$Site1Stage1InsideUDRName" -Tag @{ App="$App";  Stage="$Stage1" }
$Site1Stage1VNETPSOut = Get-AzureRmVirtualNetwork -ResourceGroupName "$Site1Stage1CRRG" -Name "$Site1Stage1VNETName"
$Site1Stage1InsideSubnetPSOut = Set-AzureRmVirtualNetworkSubnetConfig -VirtualNetwork $Site1Stage1VNETPSOut -Name "$Site1Stage1InsideSubnetName" -AddressPrefix "$Site1Stage1InsideSubnetPrefix" -RouteTable $Site1Stage1InsideUDRPSOut
Set-AzureRmVirtualNetwork -VirtualNetwork $Site1Stage1InsideSubnetPSOut
Add-AzureRmRouteConfig -Name "$routeDefault0CSRGi4onVN1SN4Name" -AddressPrefix 0.0.0.0/0 -RouteTable $Site1Stage1InsideUDRPSOut -NextHopType VirtualAppliance -NextHopIpAddress "$Site1Stage1InsideCSR1IP"
Add-AzureRmRouteConfig -Name "$routeVN1SN3CSRGi4onVN1SN4Name" -AddressPrefix "$Site1Stage1OutsideSubnetPrefix" -RouteTable $Site1Stage1InsideUDRPSOut -NextHopType VirtualAppliance -NextHopIpAddress "$Site1Stage1InsideCSR1IP"
Add-AzureRmRouteConfig -Name "$routeVN1SN4CSRGi4onVN1SN4Name" -AddressPrefix "$Site1Stage1DMZSubnetPrefix" -RouteTable $Site1Stage1InsideUDRPSOut -NextHopType VirtualAppliance -NextHopIpAddress "$Site1Stage1InsideCSR1IP"
Set-AzureRmRouteTable -RouteTable $Site1Stage1InsideUDRPSOut

$Site2Stage1MgmtUDRPSOut = New-AzureRmRouteTable -ResourceGroupName "$Site2Stage1CRRG" -Location "$Site2" -Name "$Site2Stage1MgmtUDRName" -Tag @{ App="$App";  Stage="$Stage1" }
$Site2Stage1VNETPSOut = Get-AzureRmVirtualNetwork -ResourceGroupName "$Site2Stage1CRRG" -Name "$Site2Stage1VNETName"
$Site2Stage1MgmtSubnetPSOut = Set-AzureRmVirtualNetworkSubnetConfig -VirtualNetwork $Site2Stage1VNETPSOut -Name "$Site2Stage1MgmtSubnetName" -AddressPrefix "$Site2Stage1MgmtSubnetPrefix" -RouteTable $Site2Stage1MgmtUDRPSOut
Set-AzureRmVirtualNetwork -VirtualNetwork $Site2Stage1MgmtSubnetPSOut
Add-AzureRmRouteConfig -Name "$routeVN1SN2NullonVN1SN1Name" -AddressPrefix "$Site2Stage1OutsideSubnetPrefix" -RouteTable $Site2Stage1MgmtUDRPSOut -NextHopType None
Add-AzureRmRouteConfig -Name "$routeVN1SN3NullonVN1SN1Name" -AddressPrefix "$Site2Stage1DMZSubnetPrefix" -RouteTable $Site2Stage1MgmtUDRPSOut -NextHopType None
Add-AzureRmRouteConfig -Name "$routeVN1SN4NullonVN1SN1Name" -AddressPrefix "$Site2Stage1InsideSubnetPrefix" -RouteTable $Site2Stage1MgmtUDRPSOut -NextHopType None
Set-AzureRmRouteTable -RouteTable $Site2Stage1MgmtUDRPSOut

$Site2Stage1OutsideUDRPSOut = New-AzureRmRouteTable -ResourceGroupName "$Site2Stage1CRRG" -Location "$Site2" -Name "$Site2Stage1OutsideUDRName" -Tag @{ App="$App";  Stage="$Stage1" }
$Site2Stage1VNETPSOut = Get-AzureRmVirtualNetwork -ResourceGroupName "$Site2Stage1CRRG" -Name "$Site2Stage1VNETName"
$Site2Stage1OutsideSubnetPSOut = Set-AzureRmVirtualNetworkSubnetConfig -VirtualNetwork $Site2Stage1VNETPSOut -Name "$Site2Stage1OutsideSubnetName" -AddressPrefix "$Site2Stage1OutsideSubnetPrefix" -RouteTable $Site2Stage1OutsideUDRPSOut
Set-AzureRmVirtualNetwork -VirtualNetwork $Site2Stage1OutsideSubnetPSOut

$Site2Stage1DMZUDRPSOut = New-AzureRmRouteTable -ResourceGroupName "$Site2Stage1CRRG" -Location "$Site2" -Name "$Site2Stage1DMZUDRName" -Tag @{ App="$App";  Stage="$Stage1" }
$Site2Stage1VNETPSOut = Get-AzureRmVirtualNetwork -ResourceGroupName "$Site2Stage1CRRG" -Name "$Site2Stage1VNETName"
$Site2Stage1DMZSubnetPSOut = Set-AzureRmVirtualNetworkSubnetConfig -VirtualNetwork $Site2Stage1VNETPSOut -Name "$Site2Stage1DMZSubnetName" -AddressPrefix "$Site2Stage1DMZSubnetPrefix" -RouteTable $Site2Stage1DMZUDRPSOut
Set-AzureRmVirtualNetwork -VirtualNetwork $Site2Stage1DMZSubnetPSOut
Add-AzureRmRouteConfig -Name "$routeDefault0CSRGi3onVN1SN3Name" -AddressPrefix 0.0.0.0/0 -RouteTable $Site2Stage1DMZUDRPSOut -NextHopType VirtualAppliance -NextHopIpAddress "$Site2Stage1DMZCSR1IP"
Add-AzureRmRouteConfig -Name "$routeVN1SN2CSRGi3onVN1SN3Name" -AddressPrefix "$Site2Stage1OutsideSubnetPrefix" -RouteTable $Site2Stage1DMZUDRPSOut -NextHopType VirtualAppliance -NextHopIpAddress "$Site2Stage1DMZCSR1IP"
Add-AzureRmRouteConfig -Name "$routeVN1SN4CSRGi3onVN1SN3Name" -AddressPrefix "$Site2Stage1InsideSubnetPrefix" -RouteTable $Site2Stage1DMZUDRPSOut -NextHopType VirtualAppliance -NextHopIpAddress "$Site2Stage1DMZCSR1IP"
Set-AzureRmRouteTable -RouteTable $Site2Stage1DMZUDRPSOut

$Site2Stage1InsideUDRPSOut = New-AzureRmRouteTable -ResourceGroupName "$Site2Stage1CRRG" -Location "$Site2" -Name "$Site2Stage1InsideUDRName" -Tag @{ App="$App";  Stage="$Stage1" }
$Site2Stage1VNETPSOut = Get-AzureRmVirtualNetwork -ResourceGroupName "$Site2Stage1CRRG" -Name "$Site2Stage1VNETName"
$Site2Stage1InsideSubnetPSOut = Set-AzureRmVirtualNetworkSubnetConfig -VirtualNetwork $Site2Stage1VNETPSOut -Name "$Site2Stage1InsideSubnetName" -AddressPrefix "$Site2Stage1InsideSubnetPrefix" -RouteTable $Site2Stage1InsideUDRPSOut
Set-AzureRmVirtualNetwork -VirtualNetwork $Site2Stage1InsideSubnetPSOut
Add-AzureRmRouteConfig -Name "$routeDefault0CSRGi4onVN1SN4Name" -AddressPrefix 0.0.0.0/0 -RouteTable $Site2Stage1InsideUDRPSOut -NextHopType VirtualAppliance -NextHopIpAddress "$Site2Stage1InsideCSR1IP"
Add-AzureRmRouteConfig -Name "$routeVN1SN3CSRGi4onVN1SN4Name" -AddressPrefix "$Site2Stage1OutsideSubnetPrefix" -RouteTable $Site2Stage1InsideUDRPSOut -NextHopType VirtualAppliance -NextHopIpAddress "$Site2Stage1InsideCSR1IP"
Add-AzureRmRouteConfig -Name "$routeVN1SN4CSRGi4onVN1SN4Name" -AddressPrefix "$Site2Stage1DMZSubnetPrefix" -RouteTable $Site2Stage1InsideUDRPSOut -NextHopType VirtualAppliance -NextHopIpAddress "$Site2Stage1InsideCSR1IP"
Set-AzureRmRouteTable -RouteTable $Site2Stage1InsideUDRPSOut

$Site3Stage1MgmtUDRPSOut = New-AzureRmRouteTable -ResourceGroupName "$Site3Stage1CRRG" -Location "$Site3" -Name "$Site3Stage1MgmtUDRName" -Tag @{ App="$App";  Stage="$Stage1" }
$Site3Stage1VNETPSOut = Get-AzureRmVirtualNetwork -ResourceGroupName "$Site3Stage1CRRG" -Name "$Site3Stage1VNETName"
$Site3Stage1MgmtSubnetPSOut = Set-AzureRmVirtualNetworkSubnetConfig -VirtualNetwork $Site3Stage1VNETPSOut -Name "$Site3Stage1MgmtSubnetName" -AddressPrefix "$Site3Stage1MgmtSubnetPrefix" -RouteTable $Site3Stage1MgmtUDRPSOut
Set-AzureRmVirtualNetwork -VirtualNetwork $Site3Stage1MgmtSubnetPSOut
Add-AzureRmRouteConfig -Name "$routeVN1SN2NullonVN1SN1Name" -AddressPrefix "$Site3Stage1OutsideSubnetPrefix" -RouteTable $Site3Stage1MgmtUDRPSOut -NextHopType None
Add-AzureRmRouteConfig -Name "$routeVN1SN3NullonVN1SN1Name" -AddressPrefix "$Site3Stage1DMZSubnetPrefix" -RouteTable $Site3Stage1MgmtUDRPSOut -NextHopType None
Add-AzureRmRouteConfig -Name "$routeVN1SN4NullonVN1SN1Name" -AddressPrefix "$Site3Stage1InsideSubnetPrefix" -RouteTable $Site3Stage1MgmtUDRPSOut -NextHopType None
Set-AzureRmRouteTable -RouteTable $Site3Stage1MgmtUDRPSOut

$Site3Stage1OutsideUDRPSOut = New-AzureRmRouteTable -ResourceGroupName "$Site3Stage1CRRG" -Location "$Site3" -Name "$Site3Stage1OutsideUDRName" -Tag @{ App="$App";  Stage="$Stage1" }
$Site3Stage1VNETPSOut = Get-AzureRmVirtualNetwork -ResourceGroupName "$Site3Stage1CRRG" -Name "$Site3Stage1VNETName"
$Site3Stage1OutsideSubnetPSOut = Set-AzureRmVirtualNetworkSubnetConfig -VirtualNetwork $Site3Stage1VNETPSOut -Name "$Site3Stage1OutsideSubnetName" -AddressPrefix "$Site3Stage1OutsideSubnetPrefix" -RouteTable $Site3Stage1OutsideUDRPSOut
Set-AzureRmVirtualNetwork -VirtualNetwork $Site3Stage1OutsideSubnetPSOut

$Site3Stage1DMZUDRPSOut = New-AzureRmRouteTable -ResourceGroupName "$Site3Stage1CRRG" -Location "$Site3" -Name "$Site3Stage1DMZUDRName" -Tag @{ App="$App";  Stage="$Stage1" }
$Site3Stage1VNETPSOut = Get-AzureRmVirtualNetwork -ResourceGroupName "$Site3Stage1CRRG" -Name "$Site3Stage1VNETName"
$Site3Stage1DMZSubnetPSOut = Set-AzureRmVirtualNetworkSubnetConfig -VirtualNetwork $Site3Stage1VNETPSOut -Name "$Site3Stage1DMZSubnetName" -AddressPrefix "$Site3Stage1DMZSubnetPrefix" -RouteTable $Site3Stage1DMZUDRPSOut
Set-AzureRmVirtualNetwork -VirtualNetwork $Site3Stage1DMZSubnetPSOut
Add-AzureRmRouteConfig -Name "$routeDefault0CSRGi3onVN1SN3Name" -AddressPrefix 0.0.0.0/0 -RouteTable $Site3Stage1DMZUDRPSOut -NextHopType VirtualAppliance -NextHopIpAddress "$Site3Stage1DMZCSR1IP"
Add-AzureRmRouteConfig -Name "$routeVN1SN2CSRGi3onVN1SN3Name" -AddressPrefix "$Site3Stage1OutsideSubnetPrefix" -RouteTable $Site3Stage1DMZUDRPSOut -NextHopType VirtualAppliance -NextHopIpAddress "$Site3Stage1DMZCSR1IP"
Add-AzureRmRouteConfig -Name "$routeVN1SN4CSRGi3onVN1SN3Name" -AddressPrefix "$Site3Stage1InsideSubnetPrefix" -RouteTable $Site3Stage1DMZUDRPSOut -NextHopType VirtualAppliance -NextHopIpAddress "$Site3Stage1DMZCSR1IP"
Set-AzureRmRouteTable -RouteTable $Site3Stage1DMZUDRPSOut

$Site3Stage1InsideUDRPSOut = New-AzureRmRouteTable -ResourceGroupName "$Site3Stage1CRRG" -Location "$Site3" -Name "$Site3Stage1InsideUDRName" -Tag @{ App="$App";  Stage="$Stage1" }
$Site3Stage1VNETPSOut = Get-AzureRmVirtualNetwork -ResourceGroupName "$Site3Stage1CRRG" -Name "$Site3Stage1VNETName"
$Site3Stage1InsideSubnetPSOut = Set-AzureRmVirtualNetworkSubnetConfig -VirtualNetwork $Site3Stage1VNETPSOut -Name "$Site3Stage1InsideSubnetName" -AddressPrefix "$Site3Stage1InsideSubnetPrefix" -RouteTable $Site3Stage1InsideUDRPSOut
Set-AzureRmVirtualNetwork -VirtualNetwork $Site3Stage1InsideSubnetPSOut
Add-AzureRmRouteConfig -Name "$routeDefault0CSRGi4onVN1SN4Name" -AddressPrefix 0.0.0.0/0 -RouteTable $Site3Stage1InsideUDRPSOut -NextHopType VirtualAppliance -NextHopIpAddress "$Site3Stage1InsideCSR1IP"
Add-AzureRmRouteConfig -Name "$routeVN1SN3CSRGi4onVN1SN4Name" -AddressPrefix "$Site3Stage1OutsideSubnetPrefix" -RouteTable $Site3Stage1InsideUDRPSOut -NextHopType VirtualAppliance -NextHopIpAddress "$Site3Stage1InsideCSR1IP"
Add-AzureRmRouteConfig -Name "$routeVN1SN4CSRGi4onVN1SN4Name" -AddressPrefix "$Site3Stage1DMZSubnetPrefix" -RouteTable $Site3Stage1InsideUDRPSOut -NextHopType VirtualAppliance -NextHopIpAddress "$Site3Stage1InsideCSR1IP"
Set-AzureRmRouteTable -RouteTable $Site3Stage1InsideUDRPSOut

$Site1Stage2MgmtUDRPSOut = New-AzureRmRouteTable -ResourceGroupName "$Site1Stage2CRRG" -Location "$Site1" -Name "$Site1Stage2MgmtUDRName" -Tag @{ App="$App";  Stage="$Stage2" }
$Site1Stage2VNETPSOut = Get-AzureRmVirtualNetwork -ResourceGroupName "$Site1Stage2CRRG" -Name "$Site1Stage2VNETName"
$Site1Stage2MgmtSubnetPSOut = Set-AzureRmVirtualNetworkSubnetConfig -VirtualNetwork $Site1Stage2VNETPSOut -Name "$Site1Stage2MgmtSubnetName" -AddressPrefix "$Site1Stage2MgmtSubnetPrefix" -RouteTable $Site1Stage2MgmtUDRPSOut
Set-AzureRmVirtualNetwork -VirtualNetwork $Site1Stage2MgmtSubnetPSOut
Add-AzureRmRouteConfig -Name "$routeVN1SN2NullonVN1SN1Name" -AddressPrefix "$Site1Stage2OutsideSubnetPrefix" -RouteTable $Site1Stage2MgmtUDRPSOut -NextHopType None
Add-AzureRmRouteConfig -Name "$routeVN1SN3NullonVN1SN1Name" -AddressPrefix "$Site1Stage2DMZSubnetPrefix" -RouteTable $Site1Stage2MgmtUDRPSOut -NextHopType None
Add-AzureRmRouteConfig -Name "$routeVN1SN4NullonVN1SN1Name" -AddressPrefix "$Site1Stage2InsideSubnetPrefix" -RouteTable $Site1Stage2MgmtUDRPSOut -NextHopType None
Set-AzureRmRouteTable -RouteTable $Site1Stage2MgmtUDRPSOut

$Site1Stage2OutsideUDRPSOut = New-AzureRmRouteTable -ResourceGroupName "$Site1Stage2CRRG" -Location "$Site1" -Name "$Site1Stage2OutsideUDRName" -Tag @{ App="$App";  Stage="$Stage2" }
$Site1Stage2VNETPSOut = Get-AzureRmVirtualNetwork -ResourceGroupName "$Site1Stage2CRRG" -Name "$Site1Stage2VNETName"
$Site1Stage2OutsideSubnetPSOut = Set-AzureRmVirtualNetworkSubnetConfig -VirtualNetwork $Site1Stage2VNETPSOut -Name "$Site1Stage2OutsideSubnetName" -AddressPrefix "$Site1Stage2OutsideSubnetPrefix" -RouteTable $Site1Stage2OutsideUDRPSOut
Set-AzureRmVirtualNetwork -VirtualNetwork $Site1Stage2OutsideSubnetPSOut

$Site1Stage2DMZUDRPSOut = New-AzureRmRouteTable -ResourceGroupName "$Site1Stage2CRRG" -Location "$Site1" -Name "$Site1Stage2DMZUDRName" -Tag @{ App="$App";  Stage="$Stage2" }
$Site1Stage2VNETPSOut = Get-AzureRmVirtualNetwork -ResourceGroupName "$Site1Stage2CRRG" -Name "$Site1Stage2VNETName"
$Site1Stage2DMZSubnetPSOut = Set-AzureRmVirtualNetworkSubnetConfig -VirtualNetwork $Site1Stage2VNETPSOut -Name "$Site1Stage2DMZSubnetName" -AddressPrefix "$Site1Stage2DMZSubnetPrefix" -RouteTable $Site1Stage2DMZUDRPSOut
Set-AzureRmVirtualNetwork -VirtualNetwork $Site1Stage2DMZSubnetPSOut
Add-AzureRmRouteConfig -Name "$routeDefault0CSRGi3onVN1SN3Name" -AddressPrefix 0.0.0.0/0 -RouteTable $Site1Stage2DMZUDRPSOut -NextHopType VirtualAppliance -NextHopIpAddress "$Site1Stage2DMZCSR1IP"
Add-AzureRmRouteConfig -Name "$routeVN1SN2CSRGi3onVN1SN3Name" -AddressPrefix "$Site1Stage2OutsideSubnetPrefix" -RouteTable $Site1Stage2DMZUDRPSOut -NextHopType VirtualAppliance -NextHopIpAddress "$Site1Stage2DMZCSR1IP"
Add-AzureRmRouteConfig -Name "$routeVN1SN4CSRGi3onVN1SN3Name" -AddressPrefix "$Site1Stage2InsideSubnetPrefix" -RouteTable $Site1Stage2DMZUDRPSOut -NextHopType VirtualAppliance -NextHopIpAddress "$Site1Stage2DMZCSR1IP"
Set-AzureRmRouteTable -RouteTable $Site1Stage2DMZUDRPSOut

$Site1Stage2InsideUDRPSOut = New-AzureRmRouteTable -ResourceGroupName "$Site1Stage2CRRG" -Location "$Site1" -Name "$Site1Stage2InsideUDRName" -Tag @{ App="$App";  Stage="$Stage2" }
$Site1Stage2VNETPSOut = Get-AzureRmVirtualNetwork -ResourceGroupName "$Site1Stage2CRRG" -Name "$Site1Stage2VNETName"
$Site1Stage2InsideSubnetPSOut = Set-AzureRmVirtualNetworkSubnetConfig -VirtualNetwork $Site1Stage2VNETPSOut -Name "$Site1Stage2InsideSubnetName" -AddressPrefix "$Site1Stage2InsideSubnetPrefix" -RouteTable $Site1Stage2InsideUDRPSOut
Set-AzureRmVirtualNetwork -VirtualNetwork $Site1Stage2InsideSubnetPSOut
Add-AzureRmRouteConfig -Name "$routeDefault0CSRGi4onVN1SN4Name" -AddressPrefix 0.0.0.0/0 -RouteTable $Site1Stage2InsideUDRPSOut -NextHopType VirtualAppliance -NextHopIpAddress "$Site1Stage2InsideCSR1IP"
Add-AzureRmRouteConfig -Name "$routeVN1SN3CSRGi4onVN1SN4Name" -AddressPrefix "$Site1Stage2OutsideSubnetPrefix" -RouteTable $Site1Stage2InsideUDRPSOut -NextHopType VirtualAppliance -NextHopIpAddress "$Site1Stage2InsideCSR1IP"
Add-AzureRmRouteConfig -Name "$routeVN1SN4CSRGi4onVN1SN4Name" -AddressPrefix "$Site1Stage2DMZSubnetPrefix" -RouteTable $Site1Stage2InsideUDRPSOut -NextHopType VirtualAppliance -NextHopIpAddress "$Site1Stage2InsideCSR1IP"
Set-AzureRmRouteTable -RouteTable $Site1Stage2InsideUDRPSOut

$Site2Stage2MgmtUDRPSOut = New-AzureRmRouteTable -ResourceGroupName "$Site2Stage2CRRG" -Location "$Site2" -Name "$Site2Stage2MgmtUDRName" -Tag @{ App="$App";  Stage="$Stage2" }
$Site2Stage2VNETPSOut = Get-AzureRmVirtualNetwork -ResourceGroupName "$Site2Stage2CRRG" -Name "$Site2Stage2VNETName"
$Site2Stage2MgmtSubnetPSOut = Set-AzureRmVirtualNetworkSubnetConfig -VirtualNetwork $Site2Stage2VNETPSOut -Name "$Site2Stage2MgmtSubnetName" -AddressPrefix "$Site2Stage2MgmtSubnetPrefix" -RouteTable $Site2Stage2MgmtUDRPSOut
Set-AzureRmVirtualNetwork -VirtualNetwork $Site2Stage2MgmtSubnetPSOut
Add-AzureRmRouteConfig -Name "$routeVN1SN2NullonVN1SN1Name" -AddressPrefix "$Site2Stage2OutsideSubnetPrefix" -RouteTable $Site2Stage2MgmtUDRPSOut -NextHopType None
Add-AzureRmRouteConfig -Name "$routeVN1SN3NullonVN1SN1Name" -AddressPrefix "$Site2Stage2DMZSubnetPrefix" -RouteTable $Site2Stage2MgmtUDRPSOut -NextHopType None
Add-AzureRmRouteConfig -Name "$routeVN1SN4NullonVN1SN1Name" -AddressPrefix "$Site2Stage2InsideSubnetPrefix" -RouteTable $Site2Stage2MgmtUDRPSOut -NextHopType None
Set-AzureRmRouteTable -RouteTable $Site2Stage2MgmtUDRPSOut

$Site2Stage2OutsideUDRPSOut = New-AzureRmRouteTable -ResourceGroupName "$Site2Stage2CRRG" -Location "$Site2" -Name "$Site2Stage2OutsideUDRName" -Tag @{ App="$App";  Stage="$Stage2" }
$Site2Stage2VNETPSOut = Get-AzureRmVirtualNetwork -ResourceGroupName "$Site2Stage2CRRG" -Name "$Site2Stage2VNETName"
$Site2Stage2OutsideSubnetPSOut = Set-AzureRmVirtualNetworkSubnetConfig -VirtualNetwork $Site2Stage2VNETPSOut -Name "$Site2Stage2OutsideSubnetName" -AddressPrefix "$Site2Stage2OutsideSubnetPrefix" -RouteTable $Site2Stage2OutsideUDRPSOut
Set-AzureRmVirtualNetwork -VirtualNetwork $Site2Stage2OutsideSubnetPSOut

$Site2Stage2DMZUDRPSOut = New-AzureRmRouteTable -ResourceGroupName "$Site2Stage2CRRG" -Location "$Site2" -Name "$Site2Stage2DMZUDRName" -Tag @{ App="$App";  Stage="$Stage2" }
$Site2Stage2VNETPSOut = Get-AzureRmVirtualNetwork -ResourceGroupName "$Site2Stage2CRRG" -Name "$Site2Stage2VNETName"
$Site2Stage2DMZSubnetPSOut = Set-AzureRmVirtualNetworkSubnetConfig -VirtualNetwork $Site2Stage2VNETPSOut -Name "$Site2Stage2DMZSubnetName" -AddressPrefix "$Site2Stage2DMZSubnetPrefix" -RouteTable $Site2Stage2DMZUDRPSOut
Set-AzureRmVirtualNetwork -VirtualNetwork $Site2Stage2DMZSubnetPSOut
Add-AzureRmRouteConfig -Name "$routeDefault0CSRGi3onVN1SN3Name" -AddressPrefix 0.0.0.0/0 -RouteTable $Site2Stage2DMZUDRPSOut -NextHopType VirtualAppliance -NextHopIpAddress "$Site2Stage2DMZCSR1IP"
Add-AzureRmRouteConfig -Name "$routeVN1SN2CSRGi3onVN1SN3Name" -AddressPrefix "$Site2Stage2OutsideSubnetPrefix" -RouteTable $Site2Stage2DMZUDRPSOut -NextHopType VirtualAppliance -NextHopIpAddress "$Site2Stage2DMZCSR1IP"
Add-AzureRmRouteConfig -Name "$routeVN1SN4CSRGi3onVN1SN3Name" -AddressPrefix "$Site2Stage2InsideSubnetPrefix" -RouteTable $Site2Stage2DMZUDRPSOut -NextHopType VirtualAppliance -NextHopIpAddress "$Site2Stage2DMZCSR1IP"
Set-AzureRmRouteTable -RouteTable $Site2Stage2DMZUDRPSOut

$Site2Stage2InsideUDRPSOut = New-AzureRmRouteTable -ResourceGroupName "$Site2Stage2CRRG" -Location "$Site2" -Name "$Site2Stage2InsideUDRName" -Tag @{ App="$App";  Stage="$Stage2" }
$Site2Stage2VNETPSOut = Get-AzureRmVirtualNetwork -ResourceGroupName "$Site2Stage2CRRG" -Name "$Site2Stage2VNETName"
$Site2Stage2InsideSubnetPSOut = Set-AzureRmVirtualNetworkSubnetConfig -VirtualNetwork $Site2Stage2VNETPSOut -Name "$Site2Stage2InsideSubnetName" -AddressPrefix "$Site2Stage2InsideSubnetPrefix" -RouteTable $Site2Stage2InsideUDRPSOut
Set-AzureRmVirtualNetwork -VirtualNetwork $Site2Stage2InsideSubnetPSOut
Add-AzureRmRouteConfig -Name "$routeDefault0CSRGi4onVN1SN4Name" -AddressPrefix 0.0.0.0/0 -RouteTable $Site2Stage2InsideUDRPSOut -NextHopType VirtualAppliance -NextHopIpAddress "$Site2Stage2InsideCSR1IP"
Add-AzureRmRouteConfig -Name "$routeVN1SN3CSRGi4onVN1SN4Name" -AddressPrefix "$Site2Stage2OutsideSubnetPrefix" -RouteTable $Site2Stage2InsideUDRPSOut -NextHopType VirtualAppliance -NextHopIpAddress "$Site2Stage2InsideCSR1IP"
Add-AzureRmRouteConfig -Name "$routeVN1SN4CSRGi4onVN1SN4Name" -AddressPrefix "$Site2Stage2DMZSubnetPrefix" -RouteTable $Site2Stage2InsideUDRPSOut -NextHopType VirtualAppliance -NextHopIpAddress "$Site2Stage2InsideCSR1IP"
Set-AzureRmRouteTable -RouteTable $Site2Stage2InsideUDRPSOut

$Site3Stage2MgmtUDRPSOut = New-AzureRmRouteTable -ResourceGroupName "$Site3Stage2CRRG" -Location "$Site3" -Name "$Site3Stage2MgmtUDRName" -Tag @{ App="$App";  Stage="$Stage2" }
$Site3Stage2VNETPSOut = Get-AzureRmVirtualNetwork -ResourceGroupName "$Site3Stage2CRRG" -Name "$Site3Stage2VNETName"
$Site3Stage2MgmtSubnetPSOut = Set-AzureRmVirtualNetworkSubnetConfig -VirtualNetwork $Site3Stage2VNETPSOut -Name "$Site3Stage2MgmtSubnetName" -AddressPrefix "$Site3Stage2MgmtSubnetPrefix" -RouteTable $Site3Stage2MgmtUDRPSOut
Set-AzureRmVirtualNetwork -VirtualNetwork $Site3Stage2MgmtSubnetPSOut
Add-AzureRmRouteConfig -Name "$routeVN1SN2NullonVN1SN1Name" -AddressPrefix "$Site3Stage2OutsideSubnetPrefix" -RouteTable $Site3Stage2MgmtUDRPSOut -NextHopType None
Add-AzureRmRouteConfig -Name "$routeVN1SN3NullonVN1SN1Name" -AddressPrefix "$Site3Stage2DMZSubnetPrefix" -RouteTable $Site3Stage2MgmtUDRPSOut -NextHopType None
Add-AzureRmRouteConfig -Name "$routeVN1SN4NullonVN1SN1Name" -AddressPrefix "$Site3Stage2InsideSubnetPrefix" -RouteTable $Site3Stage2MgmtUDRPSOut -NextHopType None
Set-AzureRmRouteTable -RouteTable $Site3Stage2MgmtUDRPSOut

$Site3Stage2OutsideUDRPSOut = New-AzureRmRouteTable -ResourceGroupName "$Site3Stage2CRRG" -Location "$Site3" -Name "$Site3Stage2OutsideUDRName" -Tag @{ App="$App";  Stage="$Stage2" }
$Site3Stage2VNETPSOut = Get-AzureRmVirtualNetwork -ResourceGroupName "$Site3Stage2CRRG" -Name "$Site3Stage2VNETName"
$Site3Stage2OutsideSubnetPSOut = Set-AzureRmVirtualNetworkSubnetConfig -VirtualNetwork $Site3Stage2VNETPSOut -Name "$Site3Stage2OutsideSubnetName" -AddressPrefix "$Site3Stage2OutsideSubnetPrefix" -RouteTable $Site3Stage2OutsideUDRPSOut
Set-AzureRmVirtualNetwork -VirtualNetwork $Site3Stage2OutsideSubnetPSOut

$Site3Stage2DMZUDRPSOut = New-AzureRmRouteTable -ResourceGroupName "$Site3Stage2CRRG" -Location "$Site3" -Name "$Site3Stage2DMZUDRName" -Tag @{ App="$App";  Stage="$Stage2" }
$Site3Stage2VNETPSOut = Get-AzureRmVirtualNetwork -ResourceGroupName "$Site3Stage2CRRG" -Name "$Site3Stage2VNETName"
$Site3Stage2DMZSubnetPSOut = Set-AzureRmVirtualNetworkSubnetConfig -VirtualNetwork $Site3Stage2VNETPSOut -Name "$Site3Stage2DMZSubnetName" -AddressPrefix "$Site3Stage2DMZSubnetPrefix" -RouteTable $Site3Stage2DMZUDRPSOut
Set-AzureRmVirtualNetwork -VirtualNetwork $Site3Stage2DMZSubnetPSOut
Add-AzureRmRouteConfig -Name "$routeDefault0CSRGi3onVN1SN3Name" -AddressPrefix 0.0.0.0/0 -RouteTable $Site3Stage2DMZUDRPSOut -NextHopType VirtualAppliance -NextHopIpAddress "$Site3Stage2DMZCSR1IP"
Add-AzureRmRouteConfig -Name "$routeVN1SN2CSRGi3onVN1SN3Name" -AddressPrefix "$Site3Stage2OutsideSubnetPrefix" -RouteTable $Site3Stage2DMZUDRPSOut -NextHopType VirtualAppliance -NextHopIpAddress "$Site3Stage2DMZCSR1IP"
Add-AzureRmRouteConfig -Name "$routeVN1SN4CSRGi3onVN1SN3Name" -AddressPrefix "$Site3Stage2InsideSubnetPrefix" -RouteTable $Site3Stage2DMZUDRPSOut -NextHopType VirtualAppliance -NextHopIpAddress "$Site3Stage2DMZCSR1IP"
Set-AzureRmRouteTable -RouteTable $Site3Stage2DMZUDRPSOut

$Site3Stage2InsideUDRPSOut = New-AzureRmRouteTable -ResourceGroupName "$Site3Stage2CRRG" -Location "$Site3" -Name "$Site3Stage2InsideUDRName" -Tag @{ App="$App";  Stage="$Stage2" }
$Site3Stage2VNETPSOut = Get-AzureRmVirtualNetwork -ResourceGroupName "$Site3Stage2CRRG" -Name "$Site3Stage2VNETName"
$Site3Stage2InsideSubnetPSOut = Set-AzureRmVirtualNetworkSubnetConfig -VirtualNetwork $Site3Stage2VNETPSOut -Name "$Site3Stage2InsideSubnetName" -AddressPrefix "$Site3Stage2InsideSubnetPrefix" -RouteTable $Site3Stage2InsideUDRPSOut
Set-AzureRmVirtualNetwork -VirtualNetwork $Site3Stage2InsideSubnetPSOut
Add-AzureRmRouteConfig -Name "$routeDefault0CSRGi4onVN1SN4Name" -AddressPrefix 0.0.0.0/0 -RouteTable $Site3Stage2InsideUDRPSOut -NextHopType VirtualAppliance -NextHopIpAddress "$Site3Stage2InsideCSR1IP"
Add-AzureRmRouteConfig -Name "$routeVN1SN3CSRGi4onVN1SN4Name" -AddressPrefix "$Site3Stage2OutsideSubnetPrefix" -RouteTable $Site3Stage2InsideUDRPSOut -NextHopType VirtualAppliance -NextHopIpAddress "$Site3Stage2InsideCSR1IP"
Add-AzureRmRouteConfig -Name "$routeVN1SN4CSRGi4onVN1SN4Name" -AddressPrefix "$Site3Stage2DMZSubnetPrefix" -RouteTable $Site3Stage2InsideUDRPSOut -NextHopType VirtualAppliance -NextHopIpAddress "$Site3Stage2InsideCSR1IP"
Set-AzureRmRouteTable -RouteTable $Site3Stage2InsideUDRPSOut 
