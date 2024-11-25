$ErrorActionPreference = 'Stop';

$packageName = 'unibas-brightauthor-connected'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName    = $packageName
  unzipLocation  = $toolsDir
  fileType       = 'EXE'
  url            = 'https://downloads.bsn.cloud/BA+connected+Setup+1.49.0.exe'
  silentArgs     = "/S"
  softwareName   = 'unibas-brightauthor-connected'
  checksum       = '5cd7a27660bd78998074909b91bfa4db75a43c30a97693748cc89b4a8ab6c9b7'
  checksumType   = 'sha256' 
}

Install-ChocolateyPackage @packageArgs
