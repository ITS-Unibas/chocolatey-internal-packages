$ErrorActionPreference = 'Stop';

$packageName = 'unibas-googleeath'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName    = $packageName
  unzipLocation  = $toolsDir
  fileType       = 'EXE'
  url            = ''
  silentArgs     = '/S OMAHA=1'
  validExitCodes = @(0)
  softwareName   = 'Google Earth*'
  checksum       = ''
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
