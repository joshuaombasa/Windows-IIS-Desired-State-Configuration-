# InstallIIS.ps1
# A script to automate the installation and configuration of IIS on Windows Server
# Author: [Your Name]
# License: MIT

param (
    [switch]$IncludeWebManagementTools,
    [switch]$IncludeSecurityFeatures,
    [switch]$CreateDefaultWebsite,
    [switch]$RestartServer
)

# Ensure the script runs with Administrator privileges
if (-not (Test-Administrator)) {
    Write-Host "This script requires Administrator privileges."
    exit
}

function Test-Administrator {
    $identity = [System.Security.Principal.WindowsIdentity]::GetCurrent()
    $principal = New-Object System.Security.Principal.WindowsPrincipal($identity)
    return $principal.IsInRole([System.Security.Principal.WindowsBuiltInRole]::Administrator)
}

# Install IIS and desired features
Write-Host "Installing IIS..."

# Command to install IIS and required components
Install-WindowsFeature -Name Web-Server, Web-WebServer, Web-Management-Tools, Web-Common-Http

# Install additional features if specified
if ($IncludeWebManagementTools) {
    Install-WindowsFeature -Name Web-Mgmt-Console
}
if ($IncludeSecurityFeatures) {
    Install-WindowsFeature -Name Web-Filtering, Web-Request-Filtering
}

# Create default website if needed
if ($CreateDefaultWebsite) {
    Write-Host "Creating default website..."
    New-Item -Path "C:\inetpub\wwwroot\index.html" -ItemType File
}

# Optionally restart the server
if ($RestartServer) {
    Write-Host "Restarting server to complete installation..."
    Restart-Computer
}

Write-Host "IIS installation complete."
