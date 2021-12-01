$ErrorActionPreference = 'Stop';

$packageName = 'unibas-brightauthor-connected'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName    = $packageName
  unzipLocation  = $toolsDir
  fileType       = 'EXE'
  url            = 'https://brightsignnetwork.com/download/nsingh/ba-connected/BA connected Setup 1.6.52.exe'
  silentArgs     = "/S"
  softwareName   = 'unibas-brightauthor-connected'
  checksum       = 'e83de4b0b0ad64aa10330b4f683b26e8ed0d3641ac1936cc274c60be777b7f99'
  checksumType   = 'sha256' 
}

Install-ChocolateyPackage @packageArgs
