$ErrorActionPreference = 'Stop';

$packageName = 'unibas-activeperl'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName    = $packageName
  unzipLocation  = $toolsDir
  fileType       = 'MSI'
  url            = ''
  silentArgs     = 'INSTALLDIR="C:\Program Files\Perl64" /q /l*v `"$($env:SWP)\$($env:chocolateyPackageName).$($env:chocolateyPackageVersion).InnoInstall.log`"'
  validExitCodes = @(0, 3010, 1641)
  softwareName   = 'unibas-activeperl*'
  checksum       = ''
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
