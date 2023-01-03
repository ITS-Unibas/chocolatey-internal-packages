$ErrorActionPreference = 'Stop';
  
$packageArgs = @{
  packageName   = 'unibas-rdm'
  softwareName  = 'remote desktop manager*'
  fileType      = 'EXE'
  silentArgs    = '/S'
  validExitCodes= @(0)
  url           = ''
  checksum      = ''
  checksumType  = 'sha256'
}
 
Install-ChocolateyPackage @packageArgs