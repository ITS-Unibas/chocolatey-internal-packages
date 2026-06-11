$ErrorActionPreference = 'Stop';

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName    = 'unibas-mobaxterm'
  url            = 'https://download.mobatek.net/2642026060332702/MobaXterm_Installer_v26.4.zip'
  unzipLocation  = $toolsDir
  softwareName   = 'unibas-mobaxterm*'
  checksum       = '44c21c00f264fdc9e6b997bc7d4b63a4bcebd4b953af1410f4adead545d0a4e5'
  checksumType   = 'sha256' 
}

Install-ChocolateyZipPackage @packageArgs
