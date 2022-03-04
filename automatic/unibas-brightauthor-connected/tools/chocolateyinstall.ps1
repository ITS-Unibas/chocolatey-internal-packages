$ErrorActionPreference = 'Stop';

$packageName = 'unibas-brightauthor-connected'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName    = $packageName
  unzipLocation  = $toolsDir
  fileType       = 'EXE'
  url            = 'https://brightsignnetwork.com/download/nsingh/ba-connected/BA connected Setup 1.7.2.exe'
  silentArgs     = "/S"
  softwareName   = 'unibas-brightauthor-connected'
  checksum       = '2b766980f2f9ef0183a5d0e0fa8f54f6b24cc38dab47f51908b2ab8e99db3f89'
  checksumType   = 'sha256' 
}

Install-ChocolateyPackage @packageArgs
