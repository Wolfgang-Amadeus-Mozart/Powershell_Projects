#Sanitezed version of the software
#I had to remove any sensive information like the software name and version from this code for security reasons

function Show-Menu {
     Write-Host "================ Software Management menu ================"

     Write-Host "Press '1' to install the software"
     Write-Host "Press '2' to reinstall the software (uninstalls old version and installs new version)"
     Write-Host "Press '3' to reinstall the software (reinstalls current version)"
}

function SOFTWARE_INSTALL { 
    # Function for installing the software when it is not present on the remote host
    param ([Parameter(Mandatory)]$PCName)
                $FilePath = "<Network Path to Installer>" # Placeholder for network path to installer
                $DestFolderPath = "C:\Temp"
                $installer = "C:\Temp\<software_installer.msi>" # Placeholder for installer location
 
                $Session = New-PSSession -ComputerName $PCName
 
                Copy-Item $FilePath -Destination $DestFolderPath -ToSession $Session # Copying installer to remote host
 
                Invoke-Command -Session $Session -ScriptBlock {
                
                Start-Process -FilePath "C:\Temp\<software_installer.msi>" -ArgumentList "/quiet /passive" -Wait # Installing software
                
                }
 
                Write-Host "The installer will be run on $PCName"
 
                Remove-PSSession $Session
}

function SOFTWARE_REINSTALL_OLD_NEW { 
    # Function for reinstalling the software when an older version is present
    param ([Parameter(Mandatory)]$PCName)
                $FilePath = "<Network Path to Installer>" # Placeholder for network path to installer
                $DestFolderPath = "C:\Temp"
                $installer = "C:\Temp\<software_installer.msi>"
 
                $Session = New-PSSession -ComputerName $PCName
 
                Copy-Item $FilePath -Destination $DestFolderPath -ToSession $Session
 
                Invoke-Command -Session $Session -ScriptBlock {
                
                $OldApp = Get-WmiObject -Class Win32_Product | Where-Object{$_.Name -eq "<Old Software Version Name>"} # Searching for the older version
                $OldApp.Uninstall() # Uninstalling the old version

                Start-Process -FilePath "C:\Temp\<software_installer.msi>" -ArgumentList "/quiet /passive" -Wait # Installing the new version
             
                }
 
                Write-Host "The installer will be run on $PCName"
 
                Remove-PSSession $Session
}

function SOFTWARE_REINSTALL_NEW { 
    # Function for reinstalling the current version of the software
    param ([Parameter(Mandatory)]$PCName)
                $FilePath = "<Network Path to Installer>" # Placeholder for network path to installer
                $DestFolderPath = "C:\Temp"
                $installer = "C:\Temp\<software_installer.msi>"
                $cred = Get-Credential
 
                $Session = New-PSSession -ComputerName $PCName
 
                Copy-Item $FilePath -Destination $DestFolderPath -ToSession $Session
 
                Invoke-Command -Session $Session -ScriptBlock {
                
                $CurrentApp = Get-WmiObject -Class Win32_Product | Where-Object{$_.Name -eq "<Current Software Version Name>"}
                $CurrentApp.Uninstall() # Uninstalling the current version

                Start-Process -FilePath "C:\Temp\<software_installer.msi>" -ArgumentList "/quiet /passive" -Wait # Reinstalling the current version
             
                }

                Write-Host "The installer will be run on $PCName"
 
                Remove-PSSession $Session
}

do {    
     Show-Menu
     $input = Read-Host "Select the Action"
     switch ($input) {
            '1' {
                 cls
                 SOFTWARE_INSTALL
            } 
            '2' {
                cls
                SOFTWARE_REINSTALL_OLD_NEW
            } 
            '3' {
                cls
                SOFTWARE_REINSTALL_NEW
            }
     }
     pause
} until ($input -eq 'q')
