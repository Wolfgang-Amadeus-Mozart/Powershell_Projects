# hash__tables_with_functions - This sript uses hash tables for running functions

#

# Site:       https://filipedeabreu.com

# Author:      Filipe de Abreu

# Maintenance:  Filipe de Abreu

# ------------------------------------------------------------------------ #
# Tested in:
# OS: Windows 11
#Name                           Value                                                                                                                                                          
#----                           -----                                                                                                                                                          
# PSVersion                      5.1.22621.3958                                                                                                                                                 
# PSEdition                      Desktop      

function echo1{
    echo "hellow world"
}

function echo2{
    echo "Filipe de Abreu"
}


#Creating the hash table with 2 entrys
$functions = @{
    "Hello world" = (echo1);
    "My Name" = (echo2)
}

$input = Read-Host "enter a number"

#Run A function based on user input
#Basically the input choose the function

switch ($input) {
     1{
        $functions["Hello world"]
    }2{
        $functions["My Name"]
    }
} 