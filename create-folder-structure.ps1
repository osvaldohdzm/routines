# Initialize vars used on script
$current_path = (Get-Location).Path
$user_path = $env:USERPROFILE
$custom_user_base_path = "d:\"
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

cd $current_path

Import-Module ./KnownFolderPath.ps1 -Force
Set-KnownFolderPath -KnownFolder 'Downloads' -Path 'C:\Users\ohernandez\Desktop\Local\Downloads'
Set-KnownFolderPath -KnownFolder 'Documents' -Path 'C:\Users\ohernandez\Desktop\Local\Downloads'