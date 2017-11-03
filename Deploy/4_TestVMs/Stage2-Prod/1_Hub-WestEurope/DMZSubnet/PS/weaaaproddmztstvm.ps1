$subscriptionName = '???'
Login-AzureRMAccount
Select-AzureRmSubscription -SubscriptionName $subscriptionName

New-AzureRmResourceGroupDeployment -Name rb-we-aaa-prod-tstvm01 -ResourceGroupName rb-we-aaa-prod-tstvm-rg01 -TemplateFile https://raw.githubusercontent.com/rbannist/AzureIaaS-CiscoCSR1000v-DMVPNandZBFW/master/Deploy/4_TestVMs/Stage2-Prod/1_Hub-WestEurope/DMZSubnet/PS/weaaaproddmztstvm.json -TemplateParameterUri https://raw.githubusercontent.com/rbannist/AzureIaaS-CiscoCSR1000v-DMVPNandZBFW/master/Deploy/4_TestVMs/Parameters/parameters-Standard_B2s.json