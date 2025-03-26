$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'snapgene'
  fileType       = 'EXE'
  url            = 'https://cdn.snapgene.com/downloads/SnapGene/8.x/8.0/8.0.3/snapgene_8.0.3_win.exe'
  silentArgs     = '/S'
  validExitCodes = @(0)
  softwareName   = 'Snapgene*' 
  checksum       = 'dcce206d887200e79277fd142003430662c0c6d47329e08cecfaa2a57469d717'
  checksumType   = 'sha256' 
}

Install-ChocolateyPackage @packageArgs
