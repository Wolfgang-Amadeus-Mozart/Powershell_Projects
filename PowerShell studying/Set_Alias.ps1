# Set_Alias - This script shows how to create an Alias

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

#function that creates the alias
function create_alias {
    param($aliasName, $command)

    
    Set-Alias $aliasName $command

    echo "You've set the Alias Name $aliasName to the command $command"
}

create_alias -aliasName EName -command #<your command here>