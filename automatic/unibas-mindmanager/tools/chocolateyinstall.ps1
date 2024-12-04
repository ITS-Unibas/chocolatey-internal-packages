$ErrorActionPreference = 'Stop';

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName    = 'unibas-mindmanager'
  url            = ''
  unzipLocation  = $toolsDir
  softwareName   = 'Mindmanager*'
  validExitCodes = @(0, 3010, 1641)
  silentArgs     = "/qn /norestart /l*v `"$($LogPath)Install_$($env:chocolateyPackageName)_$($env:chocolateyPackageVersion).log`" SHORTCUTDESKTOP=0 ONLINEHELP=0"
  checksum       = ''
  checksumType   = 'sha256' 
}

Install-ChocolateyZipPackage @packageArgs
