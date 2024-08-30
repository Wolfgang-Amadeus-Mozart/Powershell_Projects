#Replace

#String Manipulations

function replace_example {

Write-Host This function is running the following command
Write-Host ´Filipe Queiroz" -Replace "Queiroz", "Nunes´#Replaces the "Queiroz" part with "Nunes"
"Filipe Queiroz" -Replace "Queiroz", "Nunes" 
}

function select_string_example {

Write-Host This function is running the following command
Write-Host Tipconfig | Select-String "IPv4" #Search for only the strings with "IPv4"
ipconfig | Select-String "IPv4"
}

function select_string_plus_replace {
Write-Host This function is running the following command
Write-Host "ipconfig | Select-String "IPv4" | ForEach-Object {$_ -Replace '.*\s',''} " 
Write-Host ""
ipconfig | Select-String "IPv4" | ForEach-Object {$_ -Replace '.*\s',''} #It iterates over each matching line and removes character based on this REGEX expressio
# For the regex, the expression '.*\s' means ANY CHARACTER (.) fowolled by an WHITE SPACE (\n)it removes any charecter
So than we can return only the IPV4 address
}


select_string_plus_replace