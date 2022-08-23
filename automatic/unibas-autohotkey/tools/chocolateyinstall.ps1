
$ErrorActionPreference = 'Stop'

$toolsDir = Split-Path $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = 'unibas-autohotkey'
  fileType       = 'exe'
  url            = 'https://github.com/Lexikos/AutoHotkey_L/releases/download/v1.1.34.04/AutoHotkey_1.1.34.04_setup.exe'
  silentArgs     = "/S /D=C:\Program Files\AutoHotkey"
  softwareName   = 'AutoHotkey*'
  checksum       = '7350f50c3fc022d217821e6f416497820e6216a714c5ee859af1f36be9b740d7'
  checksumType   = 'sha256' #default is md5, can also be sha1
  validExitCodes = @(0, 1223)
}

Install-ChocolateyPackage @packageArgs

$installLocation = Get-AppInstallLocation $packageArgs.softwareName
$packageName = $packageArgs.softwareName
if ($installLocation) {
  $installName = 'AutoHotkey'
  Write-Host "$packageName installed to '$installLocation'"
  Register-Application "$installLocation\$installName.exe"
  Write-Host "$packageName registered as $installName"
}
else { Write-Warning "Can't find $packageName install location" }
