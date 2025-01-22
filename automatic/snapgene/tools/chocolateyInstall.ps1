$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'snapgene'
  fileType       = 'EXE'
  url            = 'https://cdn.snapgene.com/downloads/SnapGene/8.x/8.0/8.0.2/snapgene_8.0.2_win.exe'
  silentArgs     = '/S'
  validExitCodes = @(0)
  softwareName   = 'Snapgene*' 
  checksum       = 'a4bd445c0cbc84b6587d5b4fc4f95e845d32275a6ce5d71ec315197081740d06'
  checksumType   = 'sha256' 
}

Install-ChocolateyPackage @packageArgs
