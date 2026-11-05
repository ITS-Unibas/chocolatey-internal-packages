$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'unibas-veracrypt'
  fileType       = 'msi'
  url            = 'https://github.com/veracrypt/VeraCrypt/releases/download/VeraCrypt_1.26.31/VeraCrypt_Setup_x64_1.26.31.msi'
  silentArgs     = '/qb /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`" ACCEPTLICENSE=YES'
  validExitCodes = @(0)
  softwareName   = 'VeraCrypt*'
  checksum       = '6b0dbcc1d6910ec9f045689dd29172b4ae825b5fdcdae1a2d5f1e5b692782265'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
