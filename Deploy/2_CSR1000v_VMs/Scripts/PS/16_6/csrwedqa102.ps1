$subscriptionName = '???'
Login-AzureRMAccount
Select-AzureRmSubscription -SubscriptionName $subscriptionName

New-AzureRmResourceGroupDeployment -Name rb-we-aaa-dqa-csrvm102 -ResourceGroupName rb-we-aaa-dqa-csrvm-rg01 -TemplateFile https://raw.githubusercontent.com/rbannist/Azure-CiscoCSR1000v-DMVPNandZBFW/master/Deploy/2_CSR1000v_VMs/JSON/16_6/template-csr102.json -TemplateParameterUri https://raw.githubusercontent.com/rbannist/Azure-CiscoCSR1000v-DMVPNandZBFW/master/Deploy/2_CSR1000v_VMs/JSON/parameters-csrwedqa102.json