$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'snapgene'
  fileType       = 'EXE'
  url            = 'https://cdn.snapgene.com/downloads/SnapGene/8.x/8.2/8.2.0/snapgene_8.2.0_win.exe'
  silentArgs     = '/S'
  validExitCodes = @(0)
  softwareName   = 'Snapgene*' 
  checksum       = 'ecb79aaead3d03629a9d84ce7cba9b2900b149e5c3484ef835562a56ffa6b227'
  checksumType   = 'sha256' 
}

Install-ChocolateyPackage @packageArgs
