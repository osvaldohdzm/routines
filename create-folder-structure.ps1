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
$custom_user_base_path = "C:\Users\ohernandez\Desktop\Local"
Set-KnownFolderPath -KnownFolder 'Downloads' -Path "$custom_user_base_path\Downloads";
Set-KnownFolderPath -KnownFolder 'Documents' -Path "$custom_user_base_path\Documents";
Set-KnownFolderPath -KnownFolder 'Music' -Path "$custom_user_base_path\Music";
Set-KnownFolderPath -KnownFolder 'Pictures' -Path "$custom_user_base_path\Pictures";
Set-KnownFolderPath -KnownFolder 'Videos' -Path "$custom_user_base_path\Videos";

Write-Host "`n`nPress any key to continue...`n" -NoNewline -ForegroundColor green;
$null = $Host.UI.RawUI.ReadKey('NoEcho,IncludeKeyDown');