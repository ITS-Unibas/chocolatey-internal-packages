$ErrorActionPreference = 'Stop';

$packageName = 'unibas-freecad'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName    = $packageName
  unzipLocation  = $toolsDir
  fileType       = 'EXE'
  url64            = 'https://github.com/FreeCAD/FreeCAD/releases/download/1.1.4/FreeCAD_1.1.4-Windows-x86_64-py311-installer.exe'
  silentArgs     = '/S'
  softwareName   = 'FreeCAD*'
  checksum64       = '845f7101d33faf257a82a0cadc5f4f3804441f46ee493eb32b92fcf9c7147a24'
  checksumType   = 'sha256'
  validExitCodes = @(0) 
}

Install-ChocolateyPackage @packageArgs
