function Show-Menu{

Write-Host “================ Google Earth Installer ================”
Write-Host “================ Please enter the PC/VPC name ================”
}

function Google_Earth {
    param ([Parameter(Mandatory)]$PCName)#defining required parameters
                $FilePath = "c\temp" #Here is where I put the google earth installer
                $DestFolderPath = "C:\Temp"
                $installer = "C:\Temp\GoogleEarthProSetup.exe" #Path to where I was sending the installer in the host machine
 
 
                $Session = New-PSSession -ComputerName $PCName #Storaging the session in a variable
 
                Copy-Item $FilePath -Destination $DestFolderPath -ToSession $Session #copying the file to a remote host by using the remote session
 
                Invoke-Command -Session $Session -ScriptBlock { #using the session to start the installer
                param($installer)
 
                Start-Process -FilePath $installer -Wait
 
                } -ArgumentList $installer
 
                write-host "$Filepath will be installed on $pcname" #printing on the a screen a brief from the process
 
                Remove-PSSession $Session #removing the session
}
#cleaning the functions
Show-Menu
Google_Earth