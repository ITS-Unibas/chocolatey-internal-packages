
$ErrorActionPreference = 'Stop'

$toolsDir = Split-Path $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = 'unibas-autohotkey'
  fileType       = 'exe'
  url            = 'https://github.com/Lexikos/AutoHotkey_L/releases/download/v1.1.33.02/AutoHotkey_1.1.33.02_setup.exe'
  silentArgs     = "/S /D=C:\Program Files\AutoHotkey"
  softwareName   = 'AutoHotkey*'
  checksum       = '0775927a2db7eb4162a0107bdae764a20e9acf2cecc04de7ad2b5ac16d239ff8'
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
