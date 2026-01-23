$ErrorActionPreference = 'Stop';

$packageName = 'unibas-freecad'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName    = $packageName
  unzipLocation  = $toolsDir
  fileType       = 'EXE'
  url64            = 'https://github.com/FreeCAD/FreeCAD/releases/download/1.0.2/FreeCAD_1.0.2-conda-Windows-x86_64-installer-1.exe'
  silentArgs     = '/S'
  softwareName   = 'FreeCAD*'
  checksum64       = '1a37e156064113c069f58e40966bc1efdcc870a5471781a5322dfbb70697be73'
  checksumType   = 'sha256'
  validExitCodes = @(0) 
}

Install-ChocolateyPackage @packageArgs
