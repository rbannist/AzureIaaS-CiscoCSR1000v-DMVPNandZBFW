$subscriptionName = '???'
Login-AzureRMAccount
Select-AzureRmSubscription -SubscriptionName $subscriptionName

New-AzureRmResourceGroupDeployment -Name rb-sea-aaa-dqa-tstvm01 -ResourceGroupName rb-sea-aaa-dqa-tstvm-rg01 -TemplateFile https://raw.githubusercontent.com/rbannist/AzureIaaS-CiscoCSR1000v-DMVPNandZBFW/master/Deploy/4_TestVMs/Stage1-DevQA/2_Spoke-SouthEastAsia/InsideSubnet/PS/seaaaadqadmztstvm.json -TemplateParameterUri https://raw.githubusercontent.com/rbannist/AzureIaaS-CiscoCSR1000v-DMVPNandZBFW/master/Deploy/4_TestVMs/Parameters/parameters-Standard_B2s.json