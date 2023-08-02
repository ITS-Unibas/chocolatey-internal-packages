$ErrorActionPreference = 'Stop';

$packageName = 'unibas-freecad'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName    = $packageName
  unzipLocation  = $toolsDir
  fileType       = 'EXE'
  url            = 'https://github.com/FreeCAD/FreeCAD/releases/download/0.21.0/FreeCAD-0.21.0-WIN-x64-installer-1.exe'
  silentArgs     = '/S'
  softwareName   = 'FreeCAD*'
  checksum       = 'e6a023e2b1aa8b46cb944fdf146c2d6dde46b3955a84cbb15a66d825c933166e'
  checksumType   = 'sha256'
  validExitCodes = @(0) 
}

Install-ChocolateyPackage @packageArgs
