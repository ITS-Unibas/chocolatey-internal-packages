# Extract MSI and DAT-file from zip and remove zip-file
$zipFile = (Get-ChildItem -Path $PSScriptRoot -Filter *.zip).Name
$zipFilePath = "$PSScriptRoot\$zipFile"

Expand-Archive -Path $zipFilePath -DestinationPath $PSScriptRoot
Remove-Item -Path $zipFilePath -Force