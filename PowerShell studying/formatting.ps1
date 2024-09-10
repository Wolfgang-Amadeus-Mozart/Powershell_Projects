# Formatting - This script shows a simple way of formatting outputs in powershell

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


function format-wide-func {
    param($cmdLet) #Gets a cmdLet, like (get-process)
    return $cmdLet | Format-Wide #Print it in format-wide 
}

function format-wide-with-propertie-select{
    param($function) #Get the return of the "format-wide-func" function
    $arrayOfProperties = @("$null") 
    $properties = $var | get-member | where membertype -eq "AliasProperty" #filters the properties

    #Concat an array with each property from the cmdlet
    foreach ($propertie in $properties.name){
        $arrayOfProperties += $propertie
        }

    echo "Please select the property from the cmdlet you want to look"

    

}

format-wide-func -cmdLet (Get-Process)