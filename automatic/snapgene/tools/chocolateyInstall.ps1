$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'snapgene'
  fileType       = 'EXE'
  url            = 'https://cdn.snapgene.com/downloads/SnapGene/8.x/8.2/8.2.2/snapgene_8.2.2_win.exe'
  silentArgs     = '/S'
  validExitCodes = @(0)
  softwareName   = 'Snapgene*' 
  checksum       = 'db68e20dc8512770cbb18d71ed865e50d2346e74debccc97038080e82e4eb8a8'
  checksumType   = 'sha256' 
}

Install-ChocolateyPackage @packageArgs
