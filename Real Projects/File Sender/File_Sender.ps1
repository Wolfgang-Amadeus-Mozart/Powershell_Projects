# Eclipse Installer Sender Script

# Local path of the file/folder to be sent
$FilePath = "C:\temp\Eclipse"
# Destination folder path on remote hosts
$DestFolderPath = "c:\Eclipse"
# Array to store hostnames entered by the user
$hostnames = @()
# Drive letter used for remote access
$DriveLetter = "C$"
# Folder name to be created on remote hosts
$FolderName = "Eclipse"

# Reading hostnames manually entered by the user
for ($i = 0; $i -lt 3; $i++) {
    $name = Read-Host "Enter a hostname" # Prompt user to enter a hostname
    $hostnames += $name # Add the hostname to the array
}

# Creating a folder in the specified location on each remote host
foreach ($name in $hostnames) {
    # Create a directory on the remote host for storing the file/folder
    New-Item -Path \\$name\$DriveLetter\$FolderName -Type Directory -Force
}

# Sending the file/folder to each remote host specified by the user
For ($i = 0; $i -lt $hostnames.Length; $i++) {
    # Establish a remote session with the current hostname
    $Session = New-PSSession -ComputerName $hostnames[$i]
    # Copy the file/folder from the local path to the remote host's destination path
    Copy-Item $FilePath -Destination $DestFolderPath -ToSession $Session
}
