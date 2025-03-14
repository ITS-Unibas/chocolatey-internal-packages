$ErrorActionPreference = 'Stop'

$toolsDir = Split-Path $MyInvocation.MyCommand.Definition
  
$packageArgs = @{
  packageName   = 'unibas-rdm'
  softwareName  = 'remote desktop manager*'
  fileType      = 'EXE'
  silentArgs    = '/S'
  validExitCodes= @(0)
  url           = 'https://cdn.devolutions.net/download/Setup.RemoteDesktopManager.2025.1.25.0.exe'
  checksum      = 'dcced50705f577527a2e073537b6dec977fe0ace234428b170cd08f5722afa46'
  checksumType  = 'sha256'
}
 
Install-ChocolateyPackage @packageArgs
