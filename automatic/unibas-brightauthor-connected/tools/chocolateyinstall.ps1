$ErrorActionPreference = 'Stop';

$packageName = 'unibas-brightauthor-connected'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName    = $packageName
  unzipLocation  = $toolsDir
  fileType       = 'EXE'
  url            = 'https://brightsignnetwork.com/download/nsingh/ba-connected/BA connected Setup 1.7.7.exe'
  silentArgs     = "/S"
  softwareName   = 'unibas-brightauthor-connected'
  checksum       = '37ceeffc968b44ca54cd4cfbfe475100bd6b1219b996d5d3a0ae103122ea2ba5'
  checksumType   = 'sha256' 
}

Install-ChocolateyPackage @packageArgs
