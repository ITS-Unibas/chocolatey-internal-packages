$ErrorActionPreference = 'Stop';

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName    = 'unibas-mobaxterm'
  url            = 'https://download.mobatek.net/2612026022582601/MobaXterm_Installer_v26.1.zip'
  unzipLocation  = $toolsDir
  softwareName   = 'unibas-mobaxterm*'
  checksum       = '125a2645e1a2b12dc73b9699ee4a5c4e65e002e1a527390cd1e8643252e92ff6'
  checksumType   = 'sha256' 
}

Install-ChocolateyZipPackage @packageArgs
