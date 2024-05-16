$ErrorActionPreference = 'Stop'

$toolsDir = Split-Path $MyInvocation.MyCommand.Definition
  
$packageArgs = @{
  packageName   = 'unibas-rdm'
  softwareName  = 'remote desktop manager*'
  fileType      = 'EXE'
  silentArgs    = '/S'
  validExitCodes= @(0)
  url           = 'https://cdn.devolutions.net/download/Setup.RemoteDesktopManager.2024.1.29.0.exe'
  checksum      = '7ef07713608fce112428135da0357cd8eb038be959e912407d47e19be0af9b46'
  checksumType  = 'sha256'
}
 
Install-ChocolateyPackage @packageArgs
