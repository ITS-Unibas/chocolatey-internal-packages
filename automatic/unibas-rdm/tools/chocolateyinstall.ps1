$ErrorActionPreference = 'Stop'

$toolsDir = Split-Path $MyInvocation.MyCommand.Definition
  
$packageArgs = @{
  packageName   = 'unibas-rdm'
  softwareName  = 'remote desktop manager*'
  fileType      = 'EXE'
  silentArgs    = '/S'
  validExitCodes= @(0)
  url           = 'https://cdn.devolutions.net/download/Setup.RemoteDesktopManager.2022.3.32.0.exe'
  checksum      = 'e330e6cec3be0f775de4a89818bdf2b9f3b2fb0dc3f5722e19b741f9e3235b96'
  checksumType  = 'sha256'
}
 
Install-ChocolateyPackage @packageArgs
