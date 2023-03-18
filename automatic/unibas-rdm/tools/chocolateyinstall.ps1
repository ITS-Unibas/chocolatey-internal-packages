$ErrorActionPreference = 'Stop'

$toolsDir = Split-Path $MyInvocation.MyCommand.Definition
  
$packageArgs = @{
  packageName   = 'unibas-rdm'
  softwareName  = 'remote desktop manager*'
  fileType      = 'EXE'
  silentArgs    = '/S'
  validExitCodes= @(0)
  url           = 'https://cdn.devolutions.net/download/Setup.RemoteDesktopManager.2023.1.13.0.exe'
  checksum      = 'a281b0d4e4e62480bbada194d3e5d001b7e1af2705d120b536baa70f8bb42f17'
  checksumType  = 'sha256'
}
 
Install-ChocolateyPackage @packageArgs
