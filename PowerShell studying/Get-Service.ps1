#Get service

#$_ is reverencing the result from "Get-Service" comman, the .Status a property from the result
#Get-Service has 3 properties, Status Name and Display name, we could do the same for each one of them
Get-Service | Where-object {$_.Status -eq "Running"} #Filters only the running services

Get-Service | Where-object {$_.Status -eq "Stopped"} #Filters the stopped services