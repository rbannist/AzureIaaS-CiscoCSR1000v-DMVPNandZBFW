$subscriptionName = '???'
Login-AzureRMAccount
Select-AzureRmSubscription -SubscriptionName $subscriptionName

New-AzureRmResourceGroupDeployment -Name rb-eus-aaa-dqa-csrvm102 -ResourceGroupName rb-eus-aaa-dqa-csrvm-rg01 -TemplateFile https://raw.githubusercontent.com/rbannist/Azure-CiscoCSR1000v-DMVPNandZBFW/master/Deploy/2_CSR1000v_VMs/JSON/16_6/template-csr102.json -TemplateParameterUri https://raw.githubusercontent.com/rbannist/Azure-CiscoCSR1000v-DMVPNandZBFW/master/Deploy/2_CSR1000v_VMs/JSON/parameters-csreusdqa102.json
