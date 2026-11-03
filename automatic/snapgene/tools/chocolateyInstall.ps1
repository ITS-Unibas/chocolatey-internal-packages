$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'snapgene'
  fileType       = 'EXE'
  url            = 'https://cdn.snapgene.com/downloads/SnapGene/9.x/9.0/9.0.0/snapgene_9.0.0_win.exe'
  silentArgs     = '/S'
  validExitCodes = @(0)
  softwareName   = 'Snapgene*' 
  checksum       = '292a0250f7e229d1d7286bcadad6c5845642917563de17fc1c0aaa7cd6f51e31'
  checksumType   = 'sha256' 
}

Install-ChocolateyPackage @packageArgs
