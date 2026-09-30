$ErrorActionPreference = 'Stop'

$toolsDir = Split-Path $MyInvocation.MyCommand.Definition
  
$packageArgs = @{
  packageName   = 'unibas-rdm'
  softwareName  = 'remote desktop manager*'
  fileType      = 'EXE'
  silentArgs    = '/S'
  validExitCodes= @(0)
  url           = 'https://cdn.devolutions.net/download/Setup.RemoteDesktopManager.2026.3.12.0.exe'
  checksum      = 'A49BA04AA4988A25693E8DE7CECD9DB87BA7CEB5AA3215C70CAD52D670CDA992'
  checksumType  = 'sha256'
}
 
Install-ChocolateyPackage @packageArgs
