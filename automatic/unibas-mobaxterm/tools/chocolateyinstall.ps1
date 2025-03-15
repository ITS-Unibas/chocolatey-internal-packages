$ErrorActionPreference = 'Stop';

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName    = 'unibas-mobaxterm'
  url            = 'https://download.mobatek.net/2512025030285413/MobaXterm_Installer_v25.1.zip'
  unzipLocation  = $toolsDir
  softwareName   = 'unibas-mobaxterm*'
  checksum       = '63a4c8f5a7dec3ef04ce54d95f90165fa51f15132be4f5c21771b674f560de18'
  checksumType   = 'sha256' 
}

Install-ChocolateyZipPackage @packageArgs
