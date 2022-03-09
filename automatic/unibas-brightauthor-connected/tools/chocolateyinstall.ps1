$ErrorActionPreference = 'Stop';

$packageName = 'unibas-brightauthor-connected'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName    = $packageName
  unzipLocation  = $toolsDir
  fileType       = 'EXE'
  url            = 'https://brightsignnetwork.com/download/nsingh/ba-connected/BA connected Setup 1.7.3.exe'
  silentArgs     = "/S"
  softwareName   = 'unibas-brightauthor-connected'
  checksum       = '95c316958791a65ba7857b7eb9b0c967f5b94b89e10a9aa8a3a9f81e4f57c18b'
  checksumType   = 'sha256' 
}

Install-ChocolateyPackage @packageArgs
