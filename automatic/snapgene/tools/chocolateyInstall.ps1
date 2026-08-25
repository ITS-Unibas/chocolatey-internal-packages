$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'snapgene'
  fileType       = 'EXE'
  url            = 'https://cdn.snapgene.com/downloads/SnapGene/8.x/8.2/8.2.3/snapgene_8.2.3_win.exe'
  silentArgs     = '/S'
  validExitCodes = @(0)
  softwareName   = 'Snapgene*' 
  checksum       = '8a0ec2075706dd911596d088070b45977a1d1ff57aecaa11d351a04f461e8c0c'
  checksumType   = 'sha256' 
}

Install-ChocolateyPackage @packageArgs
