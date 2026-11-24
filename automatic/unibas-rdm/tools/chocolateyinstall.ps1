$ErrorActionPreference = 'Stop'

$toolsDir = Split-Path $MyInvocation.MyCommand.Definition
  
$packageArgs = @{
  packageName   = 'unibas-rdm'
  softwareName  = 'remote desktop manager*'
  fileType      = 'EXE'
  silentArgs    = '/S'
  validExitCodes= @(0)
  url           = 'https://cdn.devolutions.net/download/Setup.RemoteDesktopManager.2026.3.19.0.exe'
  checksum      = '010EEC332E8C5717438EE689F31191EBECA2747A4905757A8A478757F7E8A9D9'
  checksumType  = 'sha256'
}
 
Install-ChocolateyPackage @packageArgs
