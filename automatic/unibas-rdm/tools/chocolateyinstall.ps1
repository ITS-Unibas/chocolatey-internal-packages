$ErrorActionPreference = 'Stop';
  
$packageArgs = @{
  packageName   = 'rdm'
  softwareName  = 'remote desktop manager*'
  fileType      = 'EXE'
  silentArgs    = '/S'
  validExitCodes= @(0)
  url           = ''
  checksum      = ''
  checksumType  = 'sha256'
}
 
Install-ChocolateyPackage @packageArgs
