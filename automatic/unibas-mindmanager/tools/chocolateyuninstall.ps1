$ErrorActionPreference = 'Stop'

$packageName = 'unibas-mindmanager'
$softwareName = 'mindmanager*'
$installerType = 'MSI'

$silentArgs = '/qn /norestart'
$validExitCodes = @(0, 3010, 1605, 1614, 1641)

$uninstalled = $false
$local_key = 'HKCU:\Software\Microsoft\Windows\CurrentVersion\Uninstall\*'
$machine_key = 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\*'
$machine_key6432 = 'HKLM:\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall\*'

[array]$key = Get-ItemProperty -Path @($machine_key6432, $machine_key, $local_key) `
  -ErrorAction SilentlyContinue `
| Where-Object { $_.DisplayName -like "$softwareName" }

if ($key.Count -eq 1) {
  $key | ForEach-Object {
    $file = ''
    $silentArgs = "$($_.PSChildName) $silentArgs"

    Uninstall-ChocolateyPackage -PackageName $packageName `
      -FileType $installerType `
      -SilentArgs "$silentArgs" `
      -ValidExitCodes $validExitCodes `
      -File "$file"
  }
}
elseif ($key.Count -eq 0) {
  Write-Warning "$packageName has already been uninstalled by other means."
}
elseif ($key.Count -gt 1) {
  Write-Warning "$key.Count matches found!"
  Write-Warning "To prevent accidental data loss, no programs will be uninstalled."
  Write-Warning "Please alert package maintainer the following keys were matched:"
  $key | ForEach-Object { Write-Warning "- $_.DisplayName" }
}
