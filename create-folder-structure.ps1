# Initialize vars used on script
$current_path = (Get-Location).Path
$user_path = $env:USERPROFILE
$custom_user_base_path = "C:\Users\ohernandez\Desktop\Local"
$downloads_path = (New-Object -ComObject Shell.Application).NameSpace('shell:Downloads').Self.Path


Write-Host "`n`nCreating folder structura...`n" -NoNewline -ForegroundColor green
cd ..
cd ..

mkdir ConfigurationFiles
mkdir Documents
mkdir Downloads
mkdir Pictures
mkdir Repos
mkdir Tools
mkdir Videos
mkdir Music

Write-Host "`n`nChanging user libraries location...`n" -NoNewline -ForegroundColor green;
cd $current_path;
Import-Module ./KnownFolderPath.ps1 -Force;
#Set-KnownFolderPath -KnownFolder 'Downloads' -Path "$custom_user_base_path\Downloads";
#Set-KnownFolderPath -KnownFolder 'Documents' -Path "$custom_user_base_path\Documents";
#Set-KnownFolderPath -KnownFolder 'Music' -Path "$custom_user_base_path\Music";
#Set-KnownFolderPath -KnownFolder 'Pictures' -Path "$custom_user_base_path\Pictures";
#Set-KnownFolderPath -KnownFolder 'Videos' -Path "$custom_user_base_path\Videos";

reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /v "{374DE290-123F-4565-9164-39C4925E467B}" /d "$custom_user_base_path\Downloads"
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /v "{7D83EE9B-2244-4E70-B1F5-5393042AF1E4}" /d "$custom_user_base_path\Downloads"
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /v "{A0C69A99-21C8-4671-8703-7934162FCF1D}" /d $custom_user_base_path\Music"
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /v "{0DDD015D-B06C-45D5-8C4C-F59713854639}" /d "$custom_user_base_path\Pictures"
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /v "{35286A68-3C57-41A1-BBB1-0EAE73D76C95}" /d "$custom_user_base_path\Videos"
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /v "{F42EE2D3-909F-4907-8871-4C22FC0BF756}" /d "$custom_user_base_path\Documents"

Write-Host "`n`nPress any key to continue...`n" -NoNewline -ForegroundColor green;
$null = $Host.UI.RawUI.ReadKey('NoEcho,IncludeKeyDown');