# Switch_test - Created a simple swtch case that compare an human input with a predefine number

#

# Site:       https://seusite.com.br

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
                                                                                                                                                      


# ------------------------------------------------------------------------ #

$input = Read-Host "enter a number"

switch ($input) {
    {$_ -gt 2}{
    echo "The number is less than $_"
    }{$_ -lt 2}{
    echo "The number is greater than $_"
    }{$_ -eq 2}{
    echo "you got it"    
    } 
}