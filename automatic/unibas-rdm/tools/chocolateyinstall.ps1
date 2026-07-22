$ErrorActionPreference = 'Stop'

$toolsDir = Split-Path $MyInvocation.MyCommand.Definition
  
$packageArgs = @{
  packageName   = 'unibas-rdm'
  softwareName  = 'remote desktop manager*'
  fileType      = 'EXE'
  silentArgs    = '/S'
  validExitCodes= @(0)
  url           = 'https://cdn.devolutions.net/download/Setup.RemoteDesktopManager.2026.2.16.0.exe'
  checksum      = 'CCA95FB8BA466C07AA3DC7F74FEA7EF44D6D063C03064B238563318EEA5CE681'
  checksumType  = 'sha256'
}
 
Install-ChocolateyPackage @packageArgs
