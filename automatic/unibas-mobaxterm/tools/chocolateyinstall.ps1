$ErrorActionPreference = 'Stop';

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName    = 'unibas-mobaxterm'
  url            = 'https://download.mobatek.net/2422024061715901/MobaXterm_Installer_v24.2.zip'
  unzipLocation  = $toolsDir
  softwareName   = 'unibas-mobaxterm*'
  checksum       = '9c0b9f66270ce27f8f66e6954415aa68f52f7e377d4c9082df0897eb0b28e8a8'
  checksumType   = 'sha256' 
}

Install-ChocolateyZipPackage @packageArgs
