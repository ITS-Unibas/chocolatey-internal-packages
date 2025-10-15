$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'snapgene'
  fileType       = 'EXE'
  url            = 'https://cdn.snapgene.com/downloads/SnapGene/8.x/8.2/8.2.1/snapgene_8.2.1_win.exe'
  silentArgs     = '/S'
  validExitCodes = @(0)
  softwareName   = 'Snapgene*' 
  checksum       = 'f72fcbfa56ead9331a9a41db4154dc236dc4b4e3f73dd67d8401f042daa73dbd'
  checksumType   = 'sha256' 
}

Install-ChocolateyPackage @packageArgs
