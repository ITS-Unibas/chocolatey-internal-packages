$ErrorActionPreference = 'Stop';

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName    = 'unibas-mindmanager'
  url            = 'https://download.mindjet.com/MindManager_64bit_24.1.150_Admin.zip'
  unzipLocation  = $toolsDir
  softwareName   = 'Mindmanager*'
  validExitCodes = @(0, 3010, 1641)
  silentArgs     = "/qn /norestart /l*v `"$($LogPath)Install_$($env:chocolateyPackageName)_$($env:chocolateyPackageVersion).log`" SHORTCUTDESKTOP=0 ONLINEHELP=0"
  checksum       = 'b854471402e0e1c7a93844bbaee5b5dfaccad875fbfb3152d9d2730f086b2550'
  checksumType   = 'sha256' 
}

Install-ChocolateyZipPackage @packageArgs
