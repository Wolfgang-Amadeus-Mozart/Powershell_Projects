# Real PowerShell Projects

This folder contains a collection of real-world PowerShell scripts that I developed to assist a service desk team in supporting end users. These projects have been deployed into production and are actively used by agents to streamline operations and resolve common issues efficiently.

## Overview

Each project in this folder addresses specific challenges faced by the service desk, automating repetitive tasks and providing quick solutions to common problems. Below, you'll find a brief description of each project and its purpose.

## Projects

1. **Project 1: Cleaning Software Cache in a Remote Host**
   - **Description:** This script is designed to clean specifically PragmaField software's cache files from a remote host, enhancing performance and resolving common issues related to cache corruption. It connects to the remote host using provided credentials, checks connectivity, and deletes the cache directories specified for the user.
   - **Key Features:**
     - Tests connectivity to the specified PC.
     - Prompts for administrative credentials to establish a remote session.
     - Deletes cache files from specific directories in the user's profile on the remote host.
   - **Usage:** The script requires the PC name and user ID as parameters. Once connected, it prompts for credentials and removes the targeted cache files.

2. **Project 2: Mapping a Network Drive in a Remote Host**
   - **Description:** This script facilitates the mapping of a network drive on a remote host. It allows service desk agents to map drives on remote computers, helping users access required network resources without manual configuration on the user's end.
   - **Key Features:**
     - Establishes a remote session with the target computer using administrative credentials.
     - Maps a network drive with a specified drive letter and network path.
     - Handles credential validation and prompts for retrying if initial credentials are incorrect.
   - **Usage:** The script requires parameters for the drive letter, network path, and remote host PC name. It prompts for administrative credentials to map the drive remotely.

3. **Project 3: Remotely Installing Google Earth**
   - **Description:** This script automates the remote installation of Google Earth on a specified PC. It transfers the installer to the remote host and initiates the installation, allowing agents to deploy software without manual intervention on the user's machine.
   - **Key Features:**
     - Transfers the Google Earth installer to the remote host.
     - Executes the installer remotely using a PowerShell session.
     - Provides feedback on the installation progress and cleans up the session afterward.
   - **Usage:** The script requires the PC name as a parameter. It establishes a remote session, transfers the installer, and starts the installation process.

4. **Project 4: Installing and Reinstalling Software on Remote Hosts**
   - **Description:** This script handles the installation and reinstallation of a software application on a remote host. It provides options to install the software from scratch or to reinstall it in cases where the current version is outdated or malfunctioning. 
   - **Key Features:**
     - Installs the software on a remote machine if it is not already present.
     - Reinstalls the software by removing an outdated version and installing a new one.
     - Offers a menu interface for selecting the desired action (install, reinstall old version to new, or reinstall the current version).
   - **Usage:** The script requires the PC name and administrative credentials. The user selects the appropriate action from the menu, and the script performs the necessary steps to install or reinstall the software.
   - **Security Note:** The script has been sanitized for security reasons, with placeholders (`<software_installer.msi>`, `<Network Path to Installer>`, etc.) replacing sensitive information. Users must manually replace these placeholders with the actual software details for the script to function correctly.

## Getting Started

To use these scripts:

1. Clone the repository:
   ```bash
   git clone https://github.com/Wolfgang-Amadeus-Mozart/Powershell_Projects.git
   ```
   
2. Navigate to the `Real Project` folder:
   
   cd Powershell_Projects/Real%20Project

3. Follow the usage instructions provided for each script.

## Prerequisites

- PowerShell 5.1 or later
- Required permissions to execute scripts on the target system
- Any specific modules or dependencies for individual scripts (detailed in each script's section)

## Contributions

Contributions are welcome! If you have improvements or additional scripts that could help the service desk team, feel free to submit a pull request.

## License

This project is licensed under the MIT License - see the LICENSE file for details.

## Acknowledgments

- Special thanks to the service desk team for their feedback and testing.

---