#Get service

#$_ is reverencing the result from "Get-Service" comman, the .Status a property from the result
#Get-Service has 3 properties, Status Name and Display name, we could do the same for each one of them
function get_running_services {
    Get-Service | Where-object {$_.Status -eq "Running"} #Filters only the running services
}

function get_stopped_services {
    Get-Service | Where-object {$_.Status -eq "Stopped"} #Filters the stopped services
}

function get_spooler_service {
    $spooler = Get-Service -Name Spooler #getting the spooler services specifically

    if ($spooler.Status -eq "Running"){ #Printing based on spooler status 
        Write-Host "Spooler Service is running" -ForegroundColor Green
    }else{
        Write-Host "Spooler service is Stopped" -ForegroundColor Red
    }
}