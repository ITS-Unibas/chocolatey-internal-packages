$ErrorActionPreference = 'Stop';

$packageName = 'unibas-brightauthor-connected'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName    = $packageName
  unzipLocation  = $toolsDir
  fileType       = 'EXE'
  url            = 'https://downloads.bsn.cloud/BA+connected+Setup+1.55.1.exe'
  silentArgs     = "/S"
  softwareName   = 'unibas-brightauthor-connected'
  checksum       = 'e27699a83ad967704f04a067cede4af1521bb51c712617cd5c458584ebf38597'
  checksumType   = 'sha256' 
}

Install-ChocolateyPackage @packageArgs
