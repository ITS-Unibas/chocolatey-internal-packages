$ErrorActionPreference = 'Stop'

$toolsDir = Split-Path $MyInvocation.MyCommand.Definition
  
$packageArgs = @{
  packageName   = 'unibas-rdm'
  softwareName  = 'remote desktop manager*'
  fileType      = 'EXE'
  silentArgs    = '/S'
  validExitCodes= @(0)
  url           = 'https://cdn.devolutions.net/download/Setup.RemoteDesktopManager.2023.3.20.0.exe'
  checksum      = 'a4004f18c6720f27d507b45fefd39bd77bda50b18a212391b27e099c66a52faf'
  checksumType  = 'sha256'
}
 
Install-ChocolateyPackage @packageArgs
