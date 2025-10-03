$ErrorActionPreference = 'Stop';

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName    = 'unibas-mobaxterm'
  url            = 'https://download.mobatek.net/2532025092512146/MobaXterm_Installer_v25.3.zip'
  unzipLocation  = $toolsDir
  softwareName   = 'unibas-mobaxterm*'
  checksum       = '17efd554dff3a01e991a891ab7ae66c135a5a3438e1a790bf8e44096c47b220f'
  checksumType   = 'sha256' 
}

Install-ChocolateyZipPackage @packageArgs
