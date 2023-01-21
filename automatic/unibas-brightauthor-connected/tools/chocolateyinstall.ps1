$ErrorActionPreference = 'Stop';

$packageName = 'unibas-brightauthor-connected'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName    = $packageName
  unzipLocation  = $toolsDir
  fileType       = 'EXE'
  url            = 'https://www.brightsignnetwork.com/download/ba-connected-builds/ba-connected-prod/BA connected Setup 1.7.17.exe'
  silentArgs     = "/S"
  softwareName   = 'unibas-brightauthor-connected'
  checksum       = 'ddf11adb9cc286cf38c11ca0cd21021aa7d782b87d0d1120e55e56d7a9a5d822'
  checksumType   = 'sha256' 
}

Install-ChocolateyPackage @packageArgs
