$ErrorActionPreference = 'Stop';

$packageName = 'unibas-miktex'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName    = $packageName
  unzipLocation  = $toolsDir
  fileType       = 'EXE'
  url64bit       = ''
  silentArgs     = '--no-registry --shared --unattended --local-package-repository=C:\Temp\MikTex\'
  softwareName   = 'miktex*'
  checksum64     = ''
  checksumType64 = 'sha256'
}

Install-ChocolateyPackage @packageArgs
