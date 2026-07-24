$ErrorActionPreference = 'Stop';

$packageName = 'unibas-freecad'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName    = $packageName
  unzipLocation  = $toolsDir
  fileType       = 'EXE'
  url64            = 'https://github.com/FreeCAD/FreeCAD/releases/download/1.1.2/FreeCAD_1.1.2-Windows-x86_64-py311-installer.exe'
  silentArgs     = '/S'
  softwareName   = 'FreeCAD*'
  checksum64       = 'a5d9d829c10a6074620dc4ca52ca13e71d87d866e0caf4b737172ffb4f94bec9'
  checksumType   = 'sha256'
  validExitCodes = @(0) 
}

Install-ChocolateyPackage @packageArgs
