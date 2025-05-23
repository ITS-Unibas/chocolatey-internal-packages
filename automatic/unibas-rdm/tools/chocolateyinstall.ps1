$ErrorActionPreference = 'Stop'

$toolsDir = Split-Path $MyInvocation.MyCommand.Definition
  
$packageArgs = @{
  packageName   = 'unibas-rdm'
  softwareName  = 'remote desktop manager*'
  fileType      = 'EXE'
  silentArgs    = '/S'
  validExitCodes= @(0)
  url           = 'https://cdn.devolutions.net/download/Setup.RemoteDesktopManager.2025.1.40.0.exe'
  checksum      = '1935027f3452edf5965c1f9cc72bf61bd0717dbaa5f250ce4b992bcf91041f1f'
  checksumType  = 'sha256'
}
 
Install-ChocolateyPackage @packageArgs
