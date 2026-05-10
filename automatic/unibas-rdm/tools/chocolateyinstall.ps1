$ErrorActionPreference = 'Stop'

$toolsDir = Split-Path $MyInvocation.MyCommand.Definition
  
$packageArgs = @{
  packageName   = 'unibas-rdm'
  softwareName  = 'remote desktop manager*'
  fileType      = 'EXE'
  silentArgs    = '/S'
  validExitCodes= @(0)
  url           = 'https://cdn.devolutions.net/download/Setup.RemoteDesktopManager.2026.1.22.0.exe'
  checksum      = '39E888F6F958303D489341E5FF516C2B89A9B0C35EC81F2E9C408D76A3843535'
  checksumType  = 'sha256'
}
 
Install-ChocolateyPackage @packageArgs
