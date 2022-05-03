$ErrorActionPreference = 'Stop';
  
$packageArgs = @{
  packageName   = 'unibas-filezilla'
  softwareName  = 'Filezilla*'
  fileType      = 'EXE'
  silentArgs    = '/S'
  validExitCodes= @(0)
  url           = ''
  checksum      = ''
  checksumType  = 'sha256'
}
 
Install-ChocolateyPackage @packageArgs