$ErrorActionPreference = 'Stop';

$packageName = 'unibas-brightauthor-connected'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName    = $packageName
  unzipLocation  = $toolsDir
  fileType       = 'EXE'
  url            = 'https://ba-connected.s3.amazonaws.com/BA+connected+Setup+1.44.0.exe'
  silentArgs     = "/S"
  softwareName   = 'unibas-brightauthor-connected'
  checksum       = '71891fd8e6a3aafc7de8c0b0ab388f0e1945c7921d5a57ac6790f4ecdee79d07'
  checksumType   = 'sha256' 
}

Install-ChocolateyPackage @packageArgs
