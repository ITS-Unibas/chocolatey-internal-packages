$ErrorActionPreference = 'Stop';

$packageName = 'unibas-brightauthor-connected'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName    = $packageName
  unzipLocation  = $toolsDir
  fileType       = 'EXE'
  url            = 'https://downloads.bsn.cloud/BA connected Setup 1.67.0.exe'
  silentArgs     = "/S"
  softwareName   = 'unibas-brightauthor-connected'
  checksum       = '2f38acf4b56f1c0b0ee4cf634768d09d44391348d7aca64b461156ea6141b7aa'
  checksumType   = 'sha256' 
}

Install-ChocolateyPackage @packageArgs
