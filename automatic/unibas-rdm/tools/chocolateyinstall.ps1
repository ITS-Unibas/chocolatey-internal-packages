$ErrorActionPreference = 'Stop'

$toolsDir = Split-Path $MyInvocation.MyCommand.Definition
  
$packageArgs = @{
  packageName   = 'unibas-rdm'
  softwareName  = 'remote desktop manager*'
  fileType      = 'EXE'
  silentArgs    = '/S'
  validExitCodes= @(0)
  url           = 'https://cdn.devolutions.net/download/Setup.RemoteDesktopManager.2025.1.29.0.exe'
  checksum      = 'cbe711fa9cfde00c8534f73d1c5b0bd4f22d6d84bbfdbfe878c3924b09ecb1d1'
  checksumType  = 'sha256'
}
 
Install-ChocolateyPackage @packageArgs
