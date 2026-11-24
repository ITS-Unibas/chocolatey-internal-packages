$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'snapgene'
  fileType       = 'EXE'
  url            = 'https://cdn.snapgene.com/downloads/SnapGene/9.x/9.0/9.0.1/snapgene_9.0.1_win.exe'
  silentArgs     = '/S'
  validExitCodes = @(0)
  softwareName   = 'Snapgene*' 
  checksum       = '2098438e7b7deb91f152d32f2981efeba7ac8be9bca1a03f865849a5d0a5a595'
  checksumType   = 'sha256' 
}

Install-ChocolateyPackage @packageArgs
