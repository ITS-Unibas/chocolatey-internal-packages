$ErrorActionPreference = 'Stop'

$toolsDir = Split-Path $MyInvocation.MyCommand.Definition
  
$packageArgs = @{
  packageName   = 'unibas-rdm'
  softwareName  = 'remote desktop manager*'
  fileType      = 'EXE'
  silentArgs    = '/S'
  validExitCodes= @(0)
  url           = 'https://cdn.devolutions.net/download/Setup.RemoteDesktopManager.2024.3.20.0.exe'
  checksum      = 'a49850e64e7325f2f1a05f5f988ebf45c7620f6faac2b0067dc05ba38735aad7'
  checksumType  = 'sha256'
}
 
Install-ChocolateyPackage @packageArgs
