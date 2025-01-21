# InstallIIS.ps1

## Overview
`InstallIIS.ps1` is a PowerShell script designed to automate the installation and configuration of Internet Information Services (IIS) on Windows Server. This script ensures that IIS is installed with all necessary features and configurations, including web management tools and security enhancements. It is ideal for system administrators looking to quickly deploy IIS in a standardized manner.

## Features
- **Automated Installation**: Installs IIS along with essential components.
- **Customizable**: Optionally include additional features such as Web Management Tools and security features.
- **Post-Installation Setup**: Creates default websites and configures common settings.
- **Server Restart**: Automatically restart the server if required.

## Prerequisites
- **Windows Server**: Tested on Windows Server 2012, 2016, and 2019.
- **Administrator Privileges**: The script must be run with administrator rights.
- **PowerShell Version 5.0 or Later**: Ensure PowerShell is available.

## Installation Instructions

### 1. Clone the Repository
Clone this repository to your local machine using Git:
```bash
git clone https://github.com/yourusername/InstallIIS.git
cd InstallIIS
