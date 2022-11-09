# Initialize vars used on script
$current_path = (Get-Location).Path
$downloads_path = (New-Object -ComObject Shell.Application).NameSpace('shell:Downloads').Self.Path

Write-Host "`n`nUpdating repositories...`n" -NoNewline -ForegroundColor green

cd ..
$files = (Get-ChildItem . -Directory).FullName
foreach ($dirpath in $files)
{
	cd $dirpath
 if(git rev-parse --is-inside-work-tree 2> $null) {
   Write-Output "Executing actions for $dirpath"
  git add .
  git commit -m "New changes"
  git pull origin
  git push origin
}else {
  Write-Output "$dirpath is not a Git repository!"
}
}
cd $current_path

Write-Host "`n`nOrganizing downloads...`n" -NoNewline -ForegroundColor green

cd $downloads_path
foreach ($file in (get-childitem -file $downloads_path))
{
    $newpath = "$($downloads_path)\$($file.extension.trimstart('.'))"
    md $newpath -force
    move-item $file $newpath
}


Write-Host "`n`nRemoving older files in downloads...`n" -NoNewline -ForegroundColor green
cd $downloads_path
Get-ChildItem -recurse | Where {!$_.PSIsContainer -and `
$_.LastWriteTime -lt (get-date).AddDays(-30)} | Remove-Item 

Write-Host "`n`nRemoving empty folders in downloads...`n" -NoNewline -ForegroundColor green
cd $downloads_path
Get-ChildItem -recurse | Where {$_.PSIsContainer -and `
@(Get-ChildItem -Lit $_.Fullname -r | Where {!$_.PSIsContainer}).Length -eq 0} |
Remove-Item -recurse


Write-Host "`n`nRemoving older files in recycle bin...`n" -NoNewline -ForegroundColor green
$Shell = New-Object -ComObject Shell.Application
$Global:Recycler = $Shell.NameSpace(0xa)

foreach($item in $Recycler.Items())
{
    $DeletedDate = $Recycler.GetDetailsOf($item,2) -replace "\u200f|\u200e",""
    $dtDeletedDate = get-date $DeletedDate 
    If($dtDeletedDate -lt (Get-Date).AddDays(-15))
    {
        Remove-Item -Path $item.Path -Confirm:$false -Force -Recurse
    }#EndIF
}#EndForeach item

# End Script
cd $current_path

