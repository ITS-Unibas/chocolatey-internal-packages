$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'unibas-veracrypt'
  fileType       = 'msi'
  url            = 'https://github.com/veracrypt/VeraCrypt/releases/download/VeraCrypt_1.26.30/VeraCrypt_Setup_x64_1.26.30.msi'
  silentArgs     = '/qb /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`" ACCEPTLICENSE=YES'
  validExitCodes = @(0)
  softwareName   = 'VeraCrypt*'
  checksum       = '6164d4e4e8d8e600003f6cf14fafe7f50ce23b3452cae02ea19e5ad6f0cc41ad'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
