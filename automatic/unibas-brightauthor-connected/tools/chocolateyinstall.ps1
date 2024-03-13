$ErrorActionPreference = 'Stop';

$packageName = 'unibas-brightauthor-connected'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName    = $packageName
  unzipLocation  = $toolsDir
  fileType       = 'EXE'
  url            = 'https://www.brightsignnetwork.com/download/ba-connected-builds/ba-connected-prod/BA connected Setup 1.32.0.exe'
  silentArgs     = "/S"
  softwareName   = 'unibas-brightauthor-connected'
  checksum       = '3f6787c824973f02c8f8f218df6b32016128b1e1945991c9754f8c302352f934'
  checksumType   = 'sha256' 
}

Install-ChocolateyPackage @packageArgs
