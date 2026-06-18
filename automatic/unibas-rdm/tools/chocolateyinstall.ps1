$ErrorActionPreference = 'Stop'

$toolsDir = Split-Path $MyInvocation.MyCommand.Definition
  
$packageArgs = @{
  packageName   = 'unibas-rdm'
  softwareName  = 'remote desktop manager*'
  fileType      = 'EXE'
  silentArgs    = '/S'
  validExitCodes= @(0)
  url           = 'https://cdn.devolutions.net/download/Setup.RemoteDesktopManager.2026.2.11.0.exe'
  checksum      = 'E38502260344512B2648306BFA1F2D0B9F791AA20EE2A3E8C2DDC210D3CB6E53'
  checksumType  = 'sha256'
}
 
Install-ChocolateyPackage @packageArgs
