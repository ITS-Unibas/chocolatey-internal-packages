$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'unibas-veracrypt'
  fileType       = 'msi'
  url            = 'https://www.kooijman.biz/files/VeraCrypt123HF2.msi'
  silentArgs     = '/quiet /norestart'
  validExitCodes = @(0)
  softwareName   = 'VeraCrypt*'
  checksum       = 'ADA3334B3443BFE3A65B72D4FB21B734DA113A2C44D272A8416DBBBBDC2F15A4'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
