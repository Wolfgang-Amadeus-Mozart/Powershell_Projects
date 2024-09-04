#New-Project
#


$wshell = New-Object -ComObject WScript.Shell

#show shell obtions
function shows-wshell-members {
    param($shell)

    $shell | Get-Member

}

#what would we get from this functions : 
#"
#Name                     MemberType            Definition                                   
#----                     ----------            ----------                                   
#AppActivate              Method                bool AppActivate (Variant, Variant)          
#CreateShortcut           Method                IDispatch CreateShortcut (string)            
#Exec                     Method                IWshExec Exec (string)                       
#ExpandEnvironmentStrings Method                string ExpandEnvironmentStrings (string)     
#LogEvent                 Method                bool LogEvent (Variant, string, string)      
#Popup                    Method                int Popup (string, Variant, Variant, Variant)
#RegDelete                Method                void RegDelete (string)                      
#RegRead                  Method                Variant RegRead (string)                     
#RegWrite                 Method                void RegWrite (string, Variant, Variant)     
#Run                      Method                int Run (string, Variant, Variant)           
#SendKeys                 Method                void SendKeys (string, Variant)              
#Environment              ParameterizedProperty IWshEnvironment Environment (Variant) {get}  
#CurrentDirectory         Property              string CurrentDirectory () {get} {set}       
#SpecialFolders           Property              IWshCollection SpecialFolders () {get}       
#"

#pop-ups a message on the scrreen
function shell-pop-up {
    param($wshell)

    $wshell.Popup("this is very cool")
}

#opens notepad
function shell-runs{
    param($wshell)

    $wshell.Run("Notepad")
}

#Send keyboard keys
function shell-send-key{
    param(
        [Parameter(Mandatory=$true)]
        $wshell,
        [string]$text
    )

    # Loop through each character in the string
    foreach ($char in $text.ToCharArray()) {
        $wshell.SendKeys($char)
        Start-Sleep -Milliseconds 50 # Small delay between keystrokes
        #Had to add this small delay because powershell can't hand a full text writing at once
    }
}



shell-pop-up -wshell $wshell
shell-runs -wshell $wshell
$wshell.AppActivate("Notepad")
Start-Sleep 2 #waiting notepad to
shell-send-key -wshell $wshell -text "Writting through powershell"