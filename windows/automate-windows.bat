@echo off

REM Enabling WinRM for Ansible
powershell.exe -Command "Set-ExecutionPolicy Bypass -Scope Process -Force; iex ((New-Object System.Net.WebClient).DownloadString('https://raw.githubusercontent.com/ansible/ansible/devel/examples/scripts/ConfigureRemotingForAnsible.ps1'))"

REM Installing WSL
wsl --install

REM Install Chocolatey if it's not already installed
echo Installing Chocolatey...
powershell.exe -Command "Set-ExecutionPolicy Bypass -Scope Process -Force; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))"

echo Installation completed.

REM Set the URL and target file path
set "url=https://github.com/eliasnepo/dotfiles/blob/main/windows/chocolatey/packages.config"
set "targetFile=%USERPROFILE%\packages.config"

REM Download the file using curl
echo Downloading packages.config...
curl -L -o "%targetFile%" "%url%"

echo File downloaded to: %targetFile%

REM Install packages from packages.config using Chocolatey
choco install --source="%targetFile%" --yes
echo Packages installed

pause
