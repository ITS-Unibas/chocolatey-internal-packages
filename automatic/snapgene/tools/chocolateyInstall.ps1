$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'snapgene'
  fileType       = 'EXE'
  url            = 'https://cdn.snapgene.com/downloads/SnapGene/8.x/8.0/8.0.0/snapgene_8.0.0_win.exe'
  silentArgs     = '/S'
  validExitCodes = @(0)
  softwareName   = 'Snapgene*' 
  checksum       = 'efed790a5ace5ca2c776d8c83e41edc2744e06ff69ed57d358b0e5a21c86f404'
  checksumType   = 'sha256' 
}

Install-ChocolateyPackage @packageArgs
