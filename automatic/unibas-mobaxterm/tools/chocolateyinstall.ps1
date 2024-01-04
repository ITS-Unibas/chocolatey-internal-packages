$ErrorActionPreference = 'Stop';

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName    = 'unibas-mobaxterm'
  url            = 'https://download.mobatek.net/2362023122033030/MobaXterm_Installer_v23.6.zip'
  unzipLocation  = $toolsDir
  softwareName   = 'unibas-mobaxterm*'
  checksum       = '6770bb1538143f530441e9de17583d99e5cb529ae54340f84de1f313f4081927'
  checksumType   = 'sha256' 
}

Install-ChocolateyZipPackage @packageArgs
