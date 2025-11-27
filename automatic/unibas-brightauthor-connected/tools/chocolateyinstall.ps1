$ErrorActionPreference = 'Stop';

$packageName = 'unibas-brightauthor-connected'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName    = $packageName
  unzipLocation  = $toolsDir
  fileType       = 'EXE'
  url            = 'https://downloads.bsn.cloud/BA connected Setup 1.72.1.exe'
  silentArgs     = "/S"
  softwareName   = 'unibas-brightauthor-connected'
  checksum       = 'e85a82fc27b602363c6c74f72bee9c90bee4bb59705baf967cda42ffce04031f'
  checksumType   = 'sha256' 
}

Install-ChocolateyPackage @packageArgs
