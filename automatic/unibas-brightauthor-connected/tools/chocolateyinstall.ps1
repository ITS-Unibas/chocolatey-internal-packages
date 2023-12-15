$ErrorActionPreference = 'Stop';

$packageName = 'unibas-brightauthor-connected'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName    = $packageName
  unzipLocation  = $toolsDir
  fileType       = 'EXE'
  url            = 'https://www.brightsignnetwork.com/download/ba-connected-builds/ba-connected-prod/BA connected Setup 1.27.1.exe'
  silentArgs     = "/S"
  softwareName   = 'unibas-brightauthor-connected'
  checksum       = '58227edfcb5640da35189b4d4a646533276c4f22a791f117026308c818252f54'
  checksumType   = 'sha256' 
}

Install-ChocolateyPackage @packageArgs
