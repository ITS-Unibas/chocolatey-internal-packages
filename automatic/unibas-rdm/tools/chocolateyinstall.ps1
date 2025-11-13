$ErrorActionPreference = 'Stop'

$toolsDir = Split-Path $MyInvocation.MyCommand.Definition
  
$packageArgs = @{
  packageName   = 'unibas-rdm'
  softwareName  = 'remote desktop manager*'
  fileType      = 'EXE'
  silentArgs    = '/S'
  validExitCodes= @(0)
  url           = 'https://cdn.devolutions.net/download/Setup.RemoteDesktopManager.2025.3.22.0.exe'
  checksum      = 'fa240df2e70c20d5a42aef1a4ee0d2886de07ed12673711e0b912827b8fefa11'
  checksumType  = 'sha256'
}
 
Install-ChocolateyPackage @packageArgs
