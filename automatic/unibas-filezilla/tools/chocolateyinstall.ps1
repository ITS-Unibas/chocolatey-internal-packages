$ErrorActionPreference = 'Stop';
  
$packageArgs = @{
  packageName   = 'unibas-filezilla'
  softwareName  = 'Filezilla*'
  fileType      = 'EXE'
  silentArgs    = '/S'
  validExitCodes= @(0)
  url           = 'https://dl3.cdn.filezilla-project.org/client/FileZilla_3.62.2_win64-setup.exe?h=7kraNbA2lKFgdCanQkdKJw&x=1669131602'
  checksum      = 'EF3C2DFBE13AEEF9D04BF6FAEBEC26B97D614E52F24C63955BF7D36543253E07'
  checksumType  = 'sha256'
}
 
Install-ChocolateyPackage @packageArgs
