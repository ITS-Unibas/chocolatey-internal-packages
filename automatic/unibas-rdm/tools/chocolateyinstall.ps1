$ErrorActionPreference = 'Stop'

$toolsDir = Split-Path $MyInvocation.MyCommand.Definition
  
$packageArgs = @{
  packageName   = 'unibas-rdm'
  softwareName  = 'remote desktop manager*'
  fileType      = 'EXE'
  silentArgs    = '/S'
  validExitCodes= @(0)
  url           = 'https://cdn.devolutions.net/download/Setup.RemoteDesktopManager.2026.2.5.0.exe'
  checksum      = '6B238E69C65839E46638FB039D7FF9D78713142015FC271B02B34371976E9588'
  checksumType  = 'sha256'
}
 
Install-ChocolateyPackage @packageArgs
