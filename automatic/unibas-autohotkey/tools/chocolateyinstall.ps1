
$ErrorActionPreference = 'Stop'

$toolsDir = Split-Path $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = 'unibas-autohotkey'
  fileType       = 'exe'
  url            = 'https://github.com/Lexikos/AutoHotkey_L/releases/download/v1.1.33.04/AutoHotkey_1.1.33.04_setup.exe'
  silentArgs     = "/S /D=C:\Program Files\AutoHotkey"
  softwareName   = 'AutoHotkey*'
  checksum       = '4626bab387891509e96ea2cc5e024f029b83d633c77bb99e7ec6e91fed5ceaef'
  checksumType   = 'sha256' #default is md5, can also be sha1
  validExitCodes = @(0, 1223)
}

Install-ChocolateyInstallPackage @packageArgs

$installLocation = Get-AppInstallLocation $packageArgs.softwareName
$packageName = $packageArgs.softwareName
if ($installLocation) {
  $installName = 'AutoHotkey'
  Write-Host "$packageName installed to '$installLocation'"
  Register-Application "$installLocation\$installName.exe"
  Write-Host "$packageName registered as $installName"
}
else { Write-Warning "Can't find $packageName install location" }
