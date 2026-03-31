$ErrorActionPreference = 'Stop';

$packageName = 'unibas-freecad'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName    = $packageName
  unzipLocation  = $toolsDir
  fileType       = 'EXE'
  url64            = 'https://github.com/FreeCAD/FreeCAD/releases/download/1.1.0/FreeCAD_1.1.0-Windows-x86_64-py311-installer.exe'
  silentArgs     = '/S'
  softwareName   = 'FreeCAD*'
  checksum64       = '82d769db2780c6d7b20bcb4587bcfee204219b088bbc7f2e74a0d89c8e0af674'
  checksumType   = 'sha256'
  validExitCodes = @(0) 
}

Install-ChocolateyPackage @packageArgs
