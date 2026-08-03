$ErrorActionPreference = 'Stop'

$toolsDir = Split-Path $MyInvocation.MyCommand.Definition
  
$packageArgs = @{
  packageName   = 'unibas-rdm'
  softwareName  = 'remote desktop manager*'
  fileType      = 'EXE'
  silentArgs    = '/S'
  validExitCodes= @(0)
  url           = 'https://cdn.devolutions.net/download/Setup.RemoteDesktopManager.2026.2.17.0.exe'
  checksum      = 'DC9740F975D691F117234CF6666E2A450E8BFE86BAEFBA63ED4B8253E7189403'
  checksumType  = 'sha256'
}
 
Install-ChocolateyPackage @packageArgs
