$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'snapgene'
  fileType       = 'EXE'
  url            = 'https://cdn.snapgene.com/downloads/SnapGene/8.x/8.1/8.1.1/snapgene_8.1.1_win.exe'
  silentArgs     = '/S'
  validExitCodes = @(0)
  softwareName   = 'Snapgene*' 
  checksum       = '320b41b50aeb3577d696245002274a7705cbed1e98f6e88a7e90abd280d8bca3'
  checksumType   = 'sha256' 
}

Install-ChocolateyPackage @packageArgs
