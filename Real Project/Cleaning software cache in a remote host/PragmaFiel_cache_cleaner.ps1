function Show-Text{

Write-Host “================ Pragma Field Cache Cleaner ================”
write-host "Please enter the PC NAME and the UserID from the user"

}


function Cleaner {
    param (#Defining required parameters
    [Parameter(Mandatory)]$PCName,
    [Parameter(Mandatory)]$UserID
    )
                $FilePath1 = "C:\Users\$UserID\AppData\Local\CGI" #First folder to be delete
                $FilePath2 = "C:\Users\$UserID\AppData\Local\PSmart.CefBox" #Second Folder to be deleted
                  
                
                    
                while ($true) {
                    if (Test-Connection $PCName -Quiet) { #Testing the connection
                      write-host "$PCName is responding" #Printing the PC is reponding 
                      break
                  } else {
                     write-host "Invalid PCname or PC not connected" #Printing a message when the pc is not responding
                }
                    $PCName = Read-Host "Please check the PC tag and try again" #Asking to re-type pc name since the Hostname isn't responding
                }
                
                         
                

                write-host "Please enter your W-key and password" #printing a message that for requiring Workingstation\Admin keu
                

                while ($true) 
                        {
                          $cred = Get-Credential #Getting the creds and storaging it in a variable
 
                          try { #Checking if a sessions can be stablished with the provided creds
                             $Session = New-PSSession -ComputerName $PCName -Credential $cred -ErrorAction Stop
                             break
                          }
                          catch { # In case the a session can't be stablished using the provided credentials, new credentials will be required
                             Write-Output "Invalid Credentials"
                             Write-Output "Enter new credentials? Type Yes or No"s
                             if ((Read-Host) -ne "Yes") { break }

                          }
                        }

               
                Invoke-command -Session $session -ScriptBlock { #using the sessions for remotely removing the folders
                    param($FilePath1, $FilePath2)
                        Remove-Item $FilePath1
                        Remove-Item $FilePath2
                } -ArgumentList $FilePath1, $FilePath2
 
 
                Remove-PSSession $Session #removing the sessions

                write-host "Folders CGI and PSmart.CefBox deleted"

                Read-Host -Prompt "Press Enter to exit"
}


Show-Text
Cleaner