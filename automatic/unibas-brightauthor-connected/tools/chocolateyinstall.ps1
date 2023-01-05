$ErrorActionPreference = 'Stop';

$packageName = 'unibas-brightauthor-connected'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName    = $packageName
  unzipLocation  = $toolsDir
  fileType       = 'EXE'
  url            = 'https://www.brightsignnetwork.com/download/ba-connected-builds/ba-connected-prod/BA connected Setup 1.7.14.exe'
  silentArgs     = "/S"
  softwareName   = 'unibas-brightauthor-connected'
  checksum       = 'fd99aa79b98137a3a5fd5807a18fd6e3c1c01bd0fc8eaff96e11ad206f456b8c'
  checksumType   = 'sha256' 
}

Install-ChocolateyPackage @packageArgs
