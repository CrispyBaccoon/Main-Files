Write-Host "text in file: "
$items = Get-Content E:\users\bowen\onedrive\linkz\+\VBScript\newfile.txt
$items | ForEach-Object {
    echo $_
}
Write-Host "------------------------------------"