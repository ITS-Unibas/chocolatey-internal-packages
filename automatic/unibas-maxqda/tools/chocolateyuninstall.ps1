﻿
$ErrorActionPreference = 'Stop'

$packageName = 'unibas-maxqda'
$softwareName = 'unibas-maxqda*'
#$installerType = 'MSI'
$installerType = 'EXE'

$silentArgs = '/qn /norestart'
# https://msdn.microsoft.com/en-us/library/aa376931(v=vs.85).aspx
$validExitCodes = @(0, 3010, 1605, 1614, 1641)
if ($installerType -ne 'MSI') {
  $silentArgs = '/S'           # NSIS
  #$silentArgs = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-' # Inno Setup
  #$silentArgs = '/s'           # InstallShield
  #$silentArgs = '/s /v"/qn"' # InstallShield with MSI
  #$silentArgs = '/s'           # Wise InstallMaster
  #$silentArgs = '-s'           # Squirrel
  #$silentArgs = '-q'           # Install4j
  #$silentArgs = '-s -u'        # Ghost
  # Note that some installers, in addition to the silentArgs above, may also need assistance of AHK to achieve silence.
  #$silentArgs = ''             # none; make silent with input macro script like AutoHotKey (AHK)
  #       https://chocolatey.org/packages/autohotkey.portable
  $validExitCodes = @(0)
}

$uninstalled = $false
$local_key = 'HKCU:\Software\Microsoft\Windows\CurrentVersion\Uninstall\*'
$machine_key = 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\*'
$machine_key6432 = 'HKLM:\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall\*'

[array]$key = Get-ItemProperty -Path @($machine_key6432, $machine_key, $local_key) `
  -ErrorAction SilentlyContinue `
| Where-Object { $_.DisplayName -like "$softwareName" }

if ($key.Count -eq 1) {
  $key | ForEach-Object {
    $file = "$($_.UninstallString)"

    if ($installerType -eq 'MSI') {
      # The Product Code GUID is all that should be passed for MSI, and very
      # FIRST, because it comes directly after /x, which is already set in the
      # Uninstall-ChocolateyPackage msiargs (facepalm).
      $silentArgs = "$($_.PSChildName) $silentArgs"

      # Don't pass anything for file, it is ignored for msi (facepalm number 2)
      # Alternatively if you need to pass a path to an msi, determine that and
      # use it instead of the above in silentArgs, still very first
      $file = ''
    }

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
