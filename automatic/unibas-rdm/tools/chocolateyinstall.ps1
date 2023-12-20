$ErrorActionPreference = 'Stop'

$toolsDir = Split-Path $MyInvocation.MyCommand.Definition
  
$packageArgs = @{
  packageName   = 'unibas-rdm'
  softwareName  = 'remote desktop manager*'
  fileType      = 'EXE'
  silentArgs    = '/S'
  validExitCodes= @(0)
  url           = 'https://cdn.devolutions.net/download/Setup.RemoteDesktopManager.2023.3.34.0.exe'
  checksum      = 'f837057481d7409bf73621fe42117c6b65133e7c3bd9ba885f11eb0492fb94c6'
  checksumType  = 'sha256'
}
 
Install-ChocolateyPackage @packageArgs
