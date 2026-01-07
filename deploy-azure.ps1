# PowerShell script for Azure deployment
# Run this script to deploy both frontend and backend to Azure

Write-Host "Starting Azure deployment process..." -ForegroundColor Green

# Variables - Update these with your actual values
$resourceGroupName = "sign-language-rg"
$location = "East US"
$frontendAppName = "sign-language-frontend"
$backendAppName = "sign-language-backend"
$dbServerName = "sign-language-mysql"
$dbName = "sign_language_db"
$dbAdminUser = "adminuser"
$dbAdminPassword = Read-Host "Enter MySQL admin password" -AsSecureString
$dbAdminPasswordPlain = [Runtime.InteropServices.Marshal]::PtrToStringAuto([Runtime.InteropServices.Marshal]::SecureStringToBSTR($dbAdminPassword))

# Login to Azure
Write-Host "Logging in to Azure..." -ForegroundColor Yellow
az login

# Create Resource Group
Write-Host "Creating resource group..." -ForegroundColor Yellow
az group create --name $resourceGroupName --location $location

# Create MySQL Database
Write-Host "Creating Azure Database for MySQL..." -ForegroundColor Yellow
az mysql server create `
  --resource-group $resourceGroupName `
  --name $dbServerName `
  --location $location `
  --admin-user $dbAdminUser `
  --admin-password $dbAdminPasswordPlain `
  --sku-name B_Gen5_1 `
  --ssl-enforcement Disabled `
  --version 8.0

# Configure MySQL firewall
az mysql server firewall-rule create `
  --resource-group $resourceGroupName `
  --server-name $dbServerName `
  --name AllowAllWindowsAzureIps `
  --start-ip-address 0.0.0.0 `
  --end-ip-address 255.255.255.255

# Create database
az mysql db create `
  --resource-group $resourceGroupName `
  --server-name $dbServerName `
  --name $dbName

# Create App Service Plan
Write-Host "Creating App Service Plan..." -ForegroundColor Yellow
az appservice plan create `
  --name "sign-language-plan" `
  --resource-group $resourceGroupName `
  --location $location `
  --sku FREE

# Create Backend App Service
Write-Host "Creating Backend App Service..." -ForegroundColor Yellow
az webapp create `
  --resource-group $resourceGroupName `
  --plan "sign-language-plan" `
  --name $backendAppName `
  --runtime "NODE|18-lts"

# Configure backend environment variables
Write-Host "Configuring backend environment variables..." -ForegroundColor Yellow
az webapp config appsettings set `
  --name $backendAppName `
  --resource-group $resourceGroupName `
  --setting `
    DB_HOST="$dbServerName.mysql.database.azure.com" `
    DB_USER="$dbAdminUser@$dbServerName" `
    DB_PASSWORD="$dbAdminPasswordPlain" `
    DB_NAME="$dbName" `
    SESSION_SECRET="$(New-Guid)" `
    NODE_ENV="production" `
    PORT="8080"

# Create Static Web App for Frontend
Write-Host "Creating Azure Static Web App for Frontend..." -ForegroundColor Yellow
az staticwebapp create `
  --name $frontendAppName `
  --resource-group $resourceGroupName `
  --location $location `
  --source "https://github.com/YOUR_USERNAME/YOUR_REPO" `
  --branch main `
  --app-location "/" `
  --api-location "backend" `
  --output-location "build" `
  --login-with-github

Write-Host "Azure deployment setup complete!" -ForegroundColor Green
Write-Host "Frontend URL: https://$frontendAppName.azurestaticapps.net" -ForegroundColor Cyan
Write-Host "Backend URL: https://$backendAppName.azurewebsites.net" -ForegroundColor Cyan
Write-Host "Database Server: $dbServerName.mysql.database.azure.com" -ForegroundColor Cyan

# Output connection string for reference
Write-Host "`nDatabase Connection String:" -ForegroundColor Yellow
Write-Host "Server=$dbServerName.mysql.database.azure.com;Database=$dbName;Uid=$dbAdminUser@$dbServerName;Pwd=$dbAdminPasswordPlain;" -ForegroundColor White
