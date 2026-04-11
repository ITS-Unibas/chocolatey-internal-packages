$ErrorActionPreference = 'Stop';

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName    = 'unibas-mobaxterm'
  url            = 'https://download.mobatek.net/2632026040882303/MobaXterm_Installer_v26.3.zip'
  unzipLocation  = $toolsDir
  softwareName   = 'unibas-mobaxterm*'
  checksum       = '9fa4381dae047c1bc6bca3a50ff8a3bc63eb7a38fdb2137854f0548bf967e754'
  checksumType   = 'sha256' 
}

Install-ChocolateyZipPackage @packageArgs
