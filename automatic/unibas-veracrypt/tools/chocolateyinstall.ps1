$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'unibas-veracrypt'
  fileType       = 'msi'
  url            = 'https://launchpad.net/veracrypt/trunk/1.26.24/+download/VeraCrypt_Setup_x64_1.26.24.msi'
  silentArgs     = '/qb /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`" ACCEPTLICENSE=YES'
  validExitCodes = @(0)
  softwareName   = 'VeraCrypt*'
  checksum       = '48184a29db24a88acef0a0ab079230676cfdf1a8f2c87cbd42188952496b54da'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
