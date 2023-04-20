$ErrorActionPreference = 'Stop'

$toolsDir = Split-Path $MyInvocation.MyCommand.Definition
  
$packageArgs = @{
  packageName   = 'unibas-rdm'
  softwareName  = 'remote desktop manager*'
  fileType      = 'EXE'
  silentArgs    = '/S'
  validExitCodes= @(0)
  url           = 'https://cdn.devolutions.net/download/Setup.RemoteDesktopManager.2023.1.23.0.exe'
  checksum      = 'bc8a5e6f80742b359f18c47329bea9dec2a8554dfc21f27d7b0427fc3caed3f6'
  checksumType  = 'sha256'
}
 
Install-ChocolateyPackage @packageArgs
