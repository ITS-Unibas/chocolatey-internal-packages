$ErrorActionPreference = 'Stop';

$packageName = 'unibas-irfanview'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName    = $packageName
  unzipLocation  = $toolsDir
  fileType       = 'EXE'
  url64bit       = ''

  silentArgs     = '/S'
  softwareName   = 'unibas-irfanview*'
  checksum64     = ''
  checksumType64 = 'sha256' #default is checksumType
}

Install-ChocolateyPackage @packageArgs
