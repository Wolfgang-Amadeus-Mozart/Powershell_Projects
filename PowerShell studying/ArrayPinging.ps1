#working with arrays

Clear-host

$GoogleDNS = @("8.8.8.8", "8.8.4.4")

$ArrayCount = $GoogleDNS.Count #count the number of elements in an array

Write-Host Pingando todos os $ArrayCount DNS do google

Test-Connection $GoogleDNS -Count 1 #-Count number of pings
#Test-Connection will try each value of this array