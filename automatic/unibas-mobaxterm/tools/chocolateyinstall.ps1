$ErrorActionPreference = 'Stop';

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName    = 'unibas-mobaxterm'
  url            = 'https://download.mobatek.net/2542025111600034/MobaXterm_Installer_v25.4.zip'
  unzipLocation  = $toolsDir
  softwareName   = 'unibas-mobaxterm*'
  checksum       = 'f273737ab3112c7b79d49bb3ba9fe158a7c7ad44e9f6fa8123104e343669be04'
  checksumType   = 'sha256' 
}

Install-ChocolateyZipPackage @packageArgs
