$subscriptionName = '???'
Login-AzureRMAccount
Select-AzureRmSubscription -SubscriptionName $subscriptionName

New-AzureRmResourceGroupDeployment -Name rb-sea-aaa-dqa-csrvm101 -ResourceGroupName rb-sea-aaa-dqa-csrvm-rg01 -TemplateFile https://raw.githubusercontent.com/rbannist/AzureIaaS-CiscoCSR1000v-DMVPNandZBFW/master/Deploy/2_CSR1000v_VMs/JSON/template-csr101.json -TemplateParameterUri https://raw.githubusercontent.com/rbannist/AzureIaaS-CiscoCSR1000v-DMVPNandZBFW/master/Deploy/2_CSR1000v_VMs/JSON/parameters-csrseadqa101.json