$ErrorActionPreference = 'Stop';

$packageName = 'unibas-freecad'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName    = $packageName
  unzipLocation  = $toolsDir
  fileType       = 'EXE'
  url            = 'https://github.com/FreeCAD/FreeCAD/releases/download/0.20beta1/FreeCAD-0.20.0beta-WIN-x64-installer-4.exe'
  silentArgs     = '/S'
  softwareName   = 'FreeCAD*'
  checksum       = 'ca8c72fae8e5fc1addf801ca5a3c424cace308ca3843c9d408a1e0577fb7fa2d'
  checksumType   = 'sha256'
  validExitCodes = @(0) 
}

Install-ChocolateyPackage @packageArgs
