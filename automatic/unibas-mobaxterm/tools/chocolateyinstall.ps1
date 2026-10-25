$ErrorActionPreference = 'Stop';

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName    = 'unibas-mobaxterm'
  url            = 'https://download.mobatek.net/2662026100713843/MobaXterm_Installer_v26.6.zip'
  unzipLocation  = $toolsDir
  softwareName   = 'unibas-mobaxterm*'
  checksum       = 'c4840fffebf0f722e68f9279f9c57aff8782ee5fc46f1f397fb19dbf2a58dcf1'
  checksumType   = 'sha256' 
}

Install-ChocolateyZipPackage @packageArgs
