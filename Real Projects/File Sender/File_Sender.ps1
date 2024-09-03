#Eclipse installer sender

$FilePath = "C:\temp\Eclipse"
$DestFolderPath = "c:\Eclipse"
$hostnames = @()
$DriveLetter = "C$"
$FolderName = "Eclipse"

#Reading each hostname manually inputed by the user
for ($i = 0; $i -lt 3; $i++){
    $name = Read-Host "enter a hostname"
    $hostnames += $name
}

#Creates a folder in a remote folder based on the hostname
foreach ($name in $hostnames){
  New-Item -Path \\$name\C$\Eclipse -type directory -Force #It's a networklocation
}
 

For ($i=0; $i -lt $tags.Length; $i++) {
 $Session = New-PSSession -ComputerName $tags[$i]
 Copy-Item $FilePath -Destination $DestFolderPath -ToSession $Session

}