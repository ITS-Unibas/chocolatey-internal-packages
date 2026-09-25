$ErrorActionPreference = 'Stop'

$toolsDir = Split-Path $MyInvocation.MyCommand.Definition
  
$packageArgs = @{
  packageName   = 'unibas-rdm'
  softwareName  = 'remote desktop manager*'
  fileType      = 'EXE'
  silentArgs    = '/S'
  validExitCodes= @(0)
  url           = 'https://cdn.devolutions.net/download/Setup.RemoteDesktopManager.2026.3.10.0.exe'
  checksum      = '3345EFBD7046F19A45DECDF2063B4DBF424F3D33DD87F991114589D7F77B553E'
  checksumType  = 'sha256'
}
 
Install-ChocolateyPackage @packageArgs
