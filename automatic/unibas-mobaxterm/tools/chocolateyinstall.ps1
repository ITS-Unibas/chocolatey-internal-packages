$ErrorActionPreference = 'Stop';

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName    = 'unibas-mobaxterm'
  url            = 'https://download.mobatek.net/2522025040602403/MobaXterm_Installer_v25.2.zip'
  unzipLocation  = $toolsDir
  softwareName   = 'unibas-mobaxterm*'
  checksum       = 'cdcf61ffede716ad566fefcbeebda7f02eb6a51d299b8eff5d87988c8e839c3b'
  checksumType   = 'sha256' 
}

Install-ChocolateyZipPackage @packageArgs
