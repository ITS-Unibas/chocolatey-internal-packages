$ErrorActionPreference = 'Stop'

$toolsDir = Split-Path $MyInvocation.MyCommand.Definition
  
$packageArgs = @{
  packageName   = 'unibas-rdm'
  softwareName  = 'remote desktop manager*'
  fileType      = 'EXE'
  silentArgs    = '/S'
  validExitCodes= @(0)
  url           = 'https://cdn.devolutions.net/download/Setup.RemoteDesktopManager.2025.1.41.0.exe'
  checksum      = '51d1e2cdf81327114cdd270380a1980308e00211d16354e4befba297ea8dd46a'
  checksumType  = 'sha256'
}
 
Install-ChocolateyPackage @packageArgs
