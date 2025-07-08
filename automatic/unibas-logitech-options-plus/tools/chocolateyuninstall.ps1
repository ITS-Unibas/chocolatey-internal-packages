$ErrorActionPreference = 'Stop'

$packageName = 'unibas-logitech-options-plus'
$softwareName = 'Logi Options+*'
$installerType = 'EXE'

$silentArgs = '/quiet'
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
    $uninstallString = "$($_.UninstallString)"
    
    # Parse the uninstall string to separate file and arguments
    if ($uninstallString.StartsWith('"')) {
      # Path is quoted
      $endQuote = $uninstallString.IndexOf('"', 1)
      $file = $uninstallString.Substring(1, $endQuote - 1)
      $existingArgs = $uninstallString.Substring($endQuote + 1).Trim()
    } else {
      # Path is not quoted, split on first space
      $spaceIndex = $uninstallString.IndexOf(' ')
      if ($spaceIndex -gt 0) {
        $file = $uninstallString.Substring(0, $spaceIndex)
        $existingArgs = $uninstallString.Substring($spaceIndex + 1).Trim()
      } else {
        $file = $uninstallString
        $existingArgs = ""
      }
    }
    
    # Combine existing args with our silent args, but prioritize our silent args
    $finalArgs = if ($existingArgs) { "$existingArgs $silentArgs" } else { $silentArgs }

    Uninstall-ChocolateyPackage -PackageName $packageName `
      -FileType $installerType `
      -SilentArgs "$finalArgs" `
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