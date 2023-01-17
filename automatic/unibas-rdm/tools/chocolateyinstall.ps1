$ErrorActionPreference = 'Stop'

$toolsDir = Split-Path $MyInvocation.MyCommand.Definition
  
$packageArgs = @{
  packageName   = 'unibas-rdm'
  softwareName  = 'remote desktop manager*'
  fileType      = 'EXE'
  silentArgs    = '/S'
  validExitCodes= @(0)
  url           = 'https://cdn.devolutions.net/download/Setup.RemoteDesktopManager.2022.3.30.0.exe'
  checksum      = '04fd6741716c63623af6a5ec18e6a1610f05758e0df5dc65e59a2aef892da3ad'
  checksumType  = 'sha256'
}
 
Install-ChocolateyPackage @packageArgs
