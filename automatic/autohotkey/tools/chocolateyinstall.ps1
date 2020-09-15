
$ErrorActionPreference = 'Stop'

$toolsDir = Split-Path $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = 'autohotkey'
  fileType       = 'exe'
  url            = ''
  silentArgs     = "/S /D=C:\Program Files\AutoHotkey"
  softwareName   = 'AutoHotkey*'
  checksum       = ''
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
