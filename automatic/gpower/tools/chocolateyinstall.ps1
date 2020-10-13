$ErrorActionPreference = 'Stop';

$packageName = 'gpower'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = $packageName
  unzipLocation = $toolsDir
  fileType      = 'EXE'
  url           = ''
  silentArgs    = '/S'
  softwareName  = 'gpower*'
  checksum      = ''
  checksumType  = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs
