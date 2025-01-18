$ErrorActionPreference = 'Stop';

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName    = 'unibas-mobaxterm'
  url            = 'https://download.mobatek.net/2502024121622306/MobaXterm_Installer_v25.0.zip'
  unzipLocation  = $toolsDir
  softwareName   = 'unibas-mobaxterm*'
  checksum       = '317ac523678402d4c67c3bf051cdc77971515b828f3a2b7e8db73f1e4de66747'
  checksumType   = 'sha256' 
}

Install-ChocolateyZipPackage @packageArgs
