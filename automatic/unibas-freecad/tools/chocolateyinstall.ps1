$ErrorActionPreference = 'Stop';

$packageName = 'unibas-freecad'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName    = $packageName
  unzipLocation  = $toolsDir
  fileType       = 'EXE'
  url64            = 'https://github.com/FreeCAD/FreeCAD/releases/download/1.0.0/FreeCAD_1.0.0-conda-Windows-x86_64-installer-1.exe'
  silentArgs     = '/S'
  softwareName   = 'FreeCAD*'
  checksum64       = '2a173c91fb61b4eb4a086b7da5db9fa51536412db2452559c02a91f39ca55d7d'
  checksumType   = 'sha256'
  validExitCodes = @(0) 
}

Install-ChocolateyPackage @packageArgs
