$ErrorActionPreference = 'Stop';

$packageName = 'unibas-brightauthor-connected'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName    = $packageName
  unzipLocation  = $toolsDir
  fileType       = 'EXE'
  url            = 'https://downloads.bsn.cloud/BA+connected+Setup+1.49.1.exe'
  silentArgs     = "/S"
  softwareName   = 'unibas-brightauthor-connected'
  checksum       = '45e48474afa9de3d64ef2785f3b6f60a6d6174112b7538cdb4c3a7ede44fa800'
  checksumType   = 'sha256' 
}

Install-ChocolateyPackage @packageArgs
