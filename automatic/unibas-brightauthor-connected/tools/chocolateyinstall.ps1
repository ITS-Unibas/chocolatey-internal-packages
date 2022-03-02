$ErrorActionPreference = 'Stop';

$packageName = 'unibas-brightauthor-connected'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName    = $packageName
  unzipLocation  = $toolsDir
  fileType       = 'EXE'
  url            = 'https://brightsignnetwork.com/download/nsingh/ba-connected/BA connected Setup 1.7.1.exe'
  silentArgs     = "/S"
  softwareName   = 'unibas-brightauthor-connected'
  checksum       = 'ca74b5686fadf9b457ce06341b9f7902dbbc4fd00063db693a774d0ddf543ae4'
  checksumType   = 'sha256' 
}

Install-ChocolateyPackage @packageArgs
