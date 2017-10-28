#Anything with '???' needs a value adding.  Variables also can be changed to suit.

$subscriptionName = '???'
$resourceGroupName = 'rb-we-aaa-kv-rg01'
$keyVaultName = 'rb-we-aaa-kv01'
$location = 'westeurope'
$keyVaultAdminUsers = @('???')

Login-AzureRMAccount
Select-AzureRmSubscription -SubscriptionName $subscriptionName
Register-AzureRmResourceProvider -ProviderNamespace Microsoft.KeyVault
New-AzureRmResourceGroup -Name $resourceGroupName -Location $location
New-AzureRmKeyVault -VaultName $keyVaultName -ResourceGroupName $resourceGroupName -Location $location -EnabledForDiskEncryption -EnabledForDeployment -EnabledForTemplateDeployment

foreach ($keyVaultAdminUser in $keyVaultAdminUsers) {
    $UserObjectId = (Get-AzureRmADUser -SearchString $keyVaultAdminUser).Id
    Set-AzureRmKeyVaultAccessPolicy -VaultName $keyVaultName -ResourceGroupName $resourceGroupName -ObjectId $UserObjectId `
        -PermissionsToKeys all -PermissionsToSecrets all -PermissionsToCertificates all
}

Set-AzureKeyVaultSecret -VaultName $keyVaultName -Name 'csradminpassword' `
  -SecretValue (ConvertTo-SecureString -String '???' -AsPlainText -Force)

Set-AzureKeyVaultSecret -VaultName $keyVaultName -Name 'winadminpassword' `
  -SecretValue (ConvertTo-SecureString -String '???' -AsPlainText -Force)