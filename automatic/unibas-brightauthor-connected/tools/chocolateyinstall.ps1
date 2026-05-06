$ErrorActionPreference = 'Stop';

$packageName = 'unibas-brightauthor-connected'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName    = $packageName
  unzipLocation  = $toolsDir
  fileType       = 'EXE'
  url            = 'https://downloads.bsn.cloud/BA connected Setup 1.85.0.exe'
  silentArgs     = "/S"
  softwareName   = 'unibas-brightauthor-connected'
  checksum       = 'fde739ece5100a0c3d99249ad3862e5a0669f1c5ea5f72de8e4ed2b60385fbae'
  checksumType   = 'sha256' 
}

Install-ChocolateyPackage @packageArgs
