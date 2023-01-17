$ErrorActionPreference = 'Stop';
  
$packageArgs = @{
  packageName   = 'unibas-rdm'
  softwareName  = 'remote desktop manager*'
  fileType      = 'EXE'
  silentArgs    = '/S'
  validExitCodes= @(0)
  url           = ''
  checksum      = ''
  checksumType  = 'md5'
}
 
Install-ChocolateyPackage @packageArgs
