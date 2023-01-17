$ErrorActionPreference = 'Stop';
  
$packageArgs = @{
  packageName   = 'rdm'
  softwareName  = 'remote desktop manager*'
  fileType      = 'EXE'
  silentArgs    = '/S'
  validExitCodes= @(0)
  url           = 'https://cdn.devolutions.net/download/Setup.RemoteDesktopManager.2022.3.28.0.exe'
  checksum      = '88ec4f26fe4926f6bc7742fd7723486bfc90a4f376bb6f5937b64662553fcbce'
  checksumType  = 'sha256'
}
 
Install-ChocolateyPackage @packageArgs
