
$ErrorActionPreference = 'Stop'

$toolsDir = Split-Path $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = 'unibas-autohotkey'
  fileType       = 'exe'
  url            = 'https://github.com/Lexikos/AutoHotkey_L/releases/download/v1.1.33.10/AutoHotkey_1.1.33.10_setup.exe'
  silentArgs     = "/S /D=C:\Program Files\AutoHotkey"
  softwareName   = 'AutoHotkey*'
  checksum       = '8972df169a3cd8abc37de9122d54b9270d1b5fe277dd727642224fdc76f8f52d'
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
