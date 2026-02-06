$ErrorActionPreference = 'Stop';

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName    = 'unibas-mobaxterm'
  url            = 'https://download.mobatek.net/2602026012910130/MobaXterm_Installer_v26.0.zip'
  unzipLocation  = $toolsDir
  softwareName   = 'unibas-mobaxterm*'
  checksum       = 'a29dcc27bf874ad416bf00269db9ace546951cd49c7f9eb9b1837b08953d84a7'
  checksumType   = 'sha256' 
}

Install-ChocolateyZipPackage @packageArgs
