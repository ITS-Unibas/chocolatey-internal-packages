$ErrorActionPreference = 'Stop';

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName    = 'unibas-mobaxterm'
  url            = 'https://download.mobatek.net/2402024022512842/MobaXterm_Installer_v24.0.zip'
  unzipLocation  = $toolsDir
  softwareName   = 'unibas-mobaxterm*'
  checksum       = 'f9de0ab4edc1048169186dbef6b7a74714f9ab23291cd9e0555af530d964ef07'
  checksumType   = 'sha256' 
}

Install-ChocolateyZipPackage @packageArgs
