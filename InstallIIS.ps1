Configuration SetupIISServer {
    param (
        [string]$NodeName = 'localhost'
    )

    Import-DscResource -ModuleName PSDesiredStateConfiguration

    Node $NodeName {
        WindowsFeature IIS {
            Ensure = "Present"
            Name   = "Web-Server"
        }

        WindowsFeature ManagementTools {
            Ensure = "Present"
            Name   = "Web-Mgmt-Tools"
        }

        Service IISService {
            Name        = "W3SVC"
            StartupType = "Automatic"
            State       = "Running"
            DependsOn   = "IIS"
        }

        File IISRoot {
            Ensure          = "Present"
            Type            = "Directory"
            DestinationPath = "C:\inetpub\wwwroot"
        }
    }
}

# Generate MOF file
