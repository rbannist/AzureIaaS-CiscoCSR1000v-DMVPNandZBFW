$subscriptionName = '???'
Login-AzureRMAccount
Select-AzureRmSubscription -SubscriptionName $subscriptionName

New-AzureRmResourceGroupDeployment -Name rb-eus-aaa-prod-tstvm02 -ResourceGroupName rb-eus-aaa-prod-tstvm-rg01 -TemplateFile https://raw.githubusercontent.com/rbannist/AzureIaaS-CiscoCSR1000v-DMVPNandZBFW/master/Deploy/4_TestVMs/Stage2-Prod/3_Spoke-EastUS/DMZSubnet/PS/eusaaaprodinsidetstvm.json -TemplateParameterUri https://raw.githubusercontent.com/rbannist/AzureIaaS-CiscoCSR1000v-DMVPNandZBFW/master/Deploy/4_TestVMs/Parameters/parameters-Standard_A1_v2.json