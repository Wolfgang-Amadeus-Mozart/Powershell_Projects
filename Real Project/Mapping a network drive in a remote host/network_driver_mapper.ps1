#Mapping a network drive a remote computer
#This is a real project I developed e


function Show-Text{

Write-Host “================ Map NetworkDriver ================”
write-host "Please enter the PC NAME and the networkd drive Full path from the user"

}

function Mapper {
    param (
    [Parameter(Mandatory)]$remoteComputer,
    [Parameter(Mandatory)]$driveLetter,
    [Parameter(Mandatory)]$networkPath
    )



 while ($true) 
    {
        $cred = Get-Credential #creds since sometimes it require to run in with Admin creds
            try { #tries initiating a remote session
                $Session = New-PSSession -ComputerName $remoteComputer -Credential $cred -ErrorAction Stop 
                break
                }
                catch { #cathcs the error and ask the user if he wants to try again
                    Write-Output "Invalid Credentials" 
                    Write-Output "Enter new credentials? Type Yes or No"s
                    if ((Read-Host) -ne "Yes") { break }
                       }
                       }

        Invoke-command -Session $session -ScriptBlock { #use the session for remotely mapping the driver
            param($driveLetter, $networkpath, $cred)
                New-PSDrive -Persist -Name $driveLetter -PSProvider "FileSystem" -Root $networkpath -Credential $cred
        } -ArgumentList $driveLetter, $networkPath, $cred
   }

   #calling the functions
   Show-Text
   Mapper