$ErrorActionPreference = 'Stop';

$packageName = 'unibas-brightauthor-connected'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName    = $packageName
  unzipLocation  = $toolsDir
  fileType       = 'EXE'
  url            = 'https://downloads.bsn.cloud/BA connected Setup 1.76.0.exe'
  silentArgs     = "/S"
  softwareName   = 'unibas-brightauthor-connected'
  checksum       = 'fbf89b9f7efe427da284655665bc90c32fa633151190adf5762232ce19fc095d'
  checksumType   = 'sha256' 
}

Install-ChocolateyPackage @packageArgs
