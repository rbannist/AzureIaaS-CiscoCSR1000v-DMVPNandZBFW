$subscriptionName = '???'
Login-AzureRMAccount
Select-AzureRmSubscription -SubscriptionName $subscriptionName

New-AzureRmResourceGroupDeployment -Name rb-we-aaa-prod-csrvm102 -ResourceGroupName rb-we-aaa-prod-csrvm-rg01 -TemplateFile https://raw.githubusercontent.com/rbannist/Azure-CiscoCSR1000v-DMVPNandZBFW/master/Deploy/2_CSR1000v_VMs/JSON/16_6/template-csr102.json -TemplateParameterUri https://raw.githubusercontent.com/rbannist/Azure-CiscoCSR1000v-DMVPNandZBFW/master/Deploy/2_CSR1000v_VMs/JSON/parameters-csrweprod102.json