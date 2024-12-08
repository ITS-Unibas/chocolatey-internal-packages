$ErrorActionPreference = 'Stop';

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName    = 'unibas-mobaxterm'
  url            = 'https://download.mobatek.net/2442024120112207/MobaXterm_Installer_v24.4.zip'
  unzipLocation  = $toolsDir
  softwareName   = 'unibas-mobaxterm*'
  checksum       = 'f66fd78e0e004e9017580ed5d5e915e209fd9da1c47616dbd0cc1cdb7f923b19'
  checksumType   = 'sha256' 
}

Install-ChocolateyZipPackage @packageArgs
