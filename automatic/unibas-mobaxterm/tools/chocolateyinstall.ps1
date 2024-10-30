$ErrorActionPreference = 'Stop';

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName    = 'unibas-mobaxterm'
  url            = 'https://download.mobatek.net/2432024101610907/MobaXterm_Installer_v24.3.zip'
  unzipLocation  = $toolsDir
  softwareName   = 'unibas-mobaxterm*'
  checksum       = 'f406a07f5f42f029cb21e5d30fb3f0f25a9f5df62467df3775dff8f56cbd4254'
  checksumType   = 'sha256' 
}

Install-ChocolateyZipPackage @packageArgs
