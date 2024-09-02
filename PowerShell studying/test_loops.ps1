#Loop exemple of usage

function show_ips {
for ($i=1; $i -le 255; $i++){ #showwing IP's from an range
    Write-Host 192.168.0.$i #switiching of of the octes for the $i number
}
}

function test_connections_with_ips { #testing connection for each IP
for ($i=1; $i -le 5; $i++){ 
    $connection_status = Test-Connection 172.16.0.$i -Count 1 -Quiet 
    write-host connection with 172.16.0.$i is $connection_status
}
}

function for_each_test {
   #reading all files in C:\windows and showing only the file which is readonly
   foreach ($files in ls C:\Windows){
    if ( $files.IsreadOnly ){
        write-host $files.Fullname
}
}
}

for_each_ip