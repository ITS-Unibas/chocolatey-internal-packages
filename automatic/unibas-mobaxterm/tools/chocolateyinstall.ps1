$ErrorActionPreference = 'Stop';

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName    = 'unibas-mobaxterm'
  url            = 'https://download.mobatek.net/2652026082870834/MobaXterm_Installer_v26.5.zip'
  unzipLocation  = $toolsDir
  softwareName   = 'unibas-mobaxterm*'
  checksum       = 'fb898e15b98cd2656fef04108601bc6102a2f19f48b6412b25f4f0563b3b0c1d'
  checksumType   = 'sha256' 
}

Install-ChocolateyZipPackage @packageArgs
