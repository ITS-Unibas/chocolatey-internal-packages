$ErrorActionPreference = 'Stop';

$packageName = 'unibas-brightauthor-connected'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName    = $packageName
  unzipLocation  = $toolsDir
  fileType       = 'EXE'
  url            = ''
  silentArgs     = "/S"
  softwareName   = 'unibas-brightauthor-connected'
  checksum       = ''
  checksumType   = 'sha256' 
}

Install-ChocolateyPackage @packageArgs
