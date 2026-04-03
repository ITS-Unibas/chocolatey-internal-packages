$ErrorActionPreference = 'Stop';

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName    = 'unibas-mobaxterm'
  url            = 'https://download.mobatek.net/2622026032581854/MobaXterm_Installer_v26.2.zip'
  unzipLocation  = $toolsDir
  softwareName   = 'unibas-mobaxterm*'
  checksum       = 'b6e7ffe7899118adde2d18e948a4a565280b6b321060f00e156be3fcbc6b1897'
  checksumType   = 'sha256' 
}

Install-ChocolateyZipPackage @packageArgs
