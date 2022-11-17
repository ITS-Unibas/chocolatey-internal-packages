$ErrorActionPreference = 'Stop';
  
$packageArgs = @{
  packageName   = 'unibas-filezilla'
  softwareName  = 'Filezilla*'
  fileType      = 'EXE'
  silentArgs    = '/S'
  validExitCodes= @(0)
  url           = 'https://dl1.cdn.filezilla-project.org/client/FileZilla_3.62.1_win64-setup.exe?h=SequiixlAcCtT34s2XiAYA&x=1668699465'
  checksum      = '95ECA7FD49E2C332121332A54B866216F7FDFA6D5C12BB16ECDFC443D87EE79F'
  checksumType  = 'sha256'
}
 
Install-ChocolateyPackage @packageArgs
