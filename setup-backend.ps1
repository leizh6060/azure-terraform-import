# Setup Azure Terraform Backend
# This script creates the Resource Group and Storage Account required for the Terraform remote state.

$resourceGroupName = "tfstate-rg"
$location = "eastus"
$storageAccountName = "tfstate$(Get-Random -Maximum 100000)" # Storage names must be globally unique
$containerName = "tfstate"

Write-Host "Creating resource group $resourceGroupName in $location..."
az group create --name $resourceGroupName --location $location

Write-Host "Creating storage account $storageAccountName..."
az storage account create --name $storageAccountName --resource-group $resourceGroupName --location $location --sku Standard_LRS

Write-Host "Creating container $containerName..."
az storage container create --name $containerName --account-name $storageAccountName

Write-Host "`nBackend Setup Complete!`n"
Write-Host "Please update your providers.tf with the following values:"
Write-Host "resource_group_name  = '$resourceGroupName'"
Write-Host "storage_account_name = '$storageAccountName'"
Write-Host "container_name       = '$containerName'"
