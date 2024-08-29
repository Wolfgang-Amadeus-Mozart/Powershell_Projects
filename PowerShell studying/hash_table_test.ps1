#Hash Table test
Clear-host

$servers =  [ordered] @{Server1 = "192.168.1.1";server2 = "192.168.1.2";server3 = "192.168.1.3"}
$servers #Printing the hash table

Write-host ========================================
Write-Host printing te modified array
write-host ========================================


$servers["Sever1"] #show 1 specific value based on the key
$servers["Server4"] = "192.168.1.4" #Adding a new key
$servers.Remove("Server1") #removing one value
$servers