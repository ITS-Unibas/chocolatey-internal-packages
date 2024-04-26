$ErrorActionPreference = 'Stop';

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName    = 'unibas-mobaxterm'
  url            = 'https://download.mobatek.net/2412024041614011/MobaXterm_Installer_v24.1.zip'
  unzipLocation  = $toolsDir
  softwareName   = 'unibas-mobaxterm*'
  checksum       = '0745338cb95248f4ee083e417ec343fffd1b068064a93ef48b7df8a0adfc649b'
  checksumType   = 'sha256' 
}

Install-ChocolateyZipPackage @packageArgs
