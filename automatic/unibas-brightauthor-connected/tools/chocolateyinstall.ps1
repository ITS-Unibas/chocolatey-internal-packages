$ErrorActionPreference = 'Stop';

$packageName = 'unibas-brightauthor-connected'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName    = $packageName
  unzipLocation  = $toolsDir
  fileType       = 'EXE'
  url            = 'https://downloads.bsn.cloud/BA connected Setup 1.63.2.exe'
  silentArgs     = "/S"
  softwareName   = 'unibas-brightauthor-connected'
  checksum       = 'ad0e22bb364e59bcc8e8a20d8cbbc4464ada24a599b57b62b2cacafaf08d74c4'
  checksumType   = 'sha256' 
}

Install-ChocolateyPackage @packageArgs
