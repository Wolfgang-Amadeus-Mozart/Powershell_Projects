# GroupSender.ps1 - Shows and filters groups membership in Active directory for specific UserIDS

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

# Replace <placeholder> with the actual username
Write-Host "========================================="
Write-Host "Welcome to Active Directory user's groups Finder"
Write-Host "========================================="
Write-Host ""
Write-host "This scripts show the groups membership for an specified user"
$Username = read-host "Please the UserID"

# Run the net user command and store its output
$output = net user $Username /domain

# Initialize a flag to track whether we are in the "Global Group memberships" section
$inGlobalGroups = $false

# Initialize an array to store all lines of "Global Group memberships"
$globalGroups = @()

# Process each line of the output
foreach ($line in $output) {
    if ($line -match "Global Group memberships") {
        # Start capturing lines when we reach the "Global Group memberships" section
        $inGlobalGroups = $true
        # Add the line with "Global Group memberships" itself (without label)
        $globalGroups += $line -replace ".*Global Group memberships\s+", ""
    }

    # If we're in the "Global Group memberships" section, capture subsequent lines
    if ($inGlobalGroups) {
        # Stop capturing if we encounter a blank line (end of the group list)
        if ($line -match "^\s*$") {
            break
        }
        # Add the line to our results
        $globalGroups += $line.Trim()
    }
}

# Display the results
Write-Host "Here are the groups the user is part of"
Write-Host "======================================="
$globalGroups

#Read human input
$groupname = Read-host "Would you like to search for any specific group name? please enter part of the group name"

#Storaging the slection into a variable
$selection = $globalGroups | Select-String $groupname

#Is selection null?
if ($selection -eq $null){
    Write-Host ""
    Write-Host "======================================="
    echo "this user not have any group that looks like $groupname"
    }else{
        Write-Host "======================================="
        Write-Host ""
        write-host "These are the groups this user is part of that looks like $groupname"
        $selection
}

#prompt
Read-Host -Prompt "Press Enter to exit"