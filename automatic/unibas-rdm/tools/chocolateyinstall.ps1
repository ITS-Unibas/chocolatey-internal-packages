$ErrorActionPreference = 'Stop'

$toolsDir = Split-Path $MyInvocation.MyCommand.Definition
  
$packageArgs = @{
  packageName   = 'unibas-rdm'
  softwareName  = 'remote desktop manager*'
  fileType      = 'EXE'
  silentArgs    = '/S'
  validExitCodes= @(0)
  url           = 'https://cdn.devolutions.net/download/Setup.RemoteDesktopManager.2026.1.16.0.exe'
  checksum      = '986637f6de245af241399a4870845ee0c22f0104dcd7cdadfbfee5ce9ce45acc'
  checksumType  = 'sha256'
}
 
Install-ChocolateyPackage @packageArgs
