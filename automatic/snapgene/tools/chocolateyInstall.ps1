$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'snapgene'
  fileType       = 'EXE'
  url            = 'https://cdn.snapgene.com/downloads/SnapGene/8.x/8.0/8.0.1/snapgene_8.0.1_win.exe'
  silentArgs     = '/S'
  validExitCodes = @(0)
  softwareName   = 'Snapgene*' 
  checksum       = '902ed56aa7264b2f51dba01e673fce36241d0deae1431a5fc9781b3bba8e9690'
  checksumType   = 'sha256' 
}

Install-ChocolateyPackage @packageArgs
