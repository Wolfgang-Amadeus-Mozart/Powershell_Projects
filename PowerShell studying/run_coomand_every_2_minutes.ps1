# Run command every 2 minutes - This sript runs a commands every 2 seconds in a loop

#

# Site:       https://filipedeabreu.com

# Author:      Filipe de Abreu

# Maintenance:  Filipe de Abreu

# Note: This script has been sanitized to remove company-specific details.

# ------------------------------------------------------------------------ #
# Tested in:
# OS: Windows 11
#Name                           Value                                                                                                                                                          
#----                           -----                                                                                                                                                          
# PSVersion                      5.1.22621.3958                                                                                                                                                 
# PSEdition                      Desktop      


function run_command {
    param($i=1) #for counting the ammount of time
    while($true){
        echo "this is running again for the $i time"
        Start-Sleep -Seconds 2 #Static value, will always run every 2 seconds
        $i++
    }
}

function run_command_userInpute {
    param($i=1)
    while($true){
        $reader = read-host "Please input the interval in seconds" #manually defining the interval
        echo "this is running again for the $i time"
        Start-Sleep -Seconds $reader
        $i++
    }
}

#Uncomment on of the function for running it 

#run_command
#run_command_userInpute