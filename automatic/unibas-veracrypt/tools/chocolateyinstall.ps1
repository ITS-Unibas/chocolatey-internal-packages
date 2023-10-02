$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'unibas-veracrypt'
  fileType       = 'msi'
  url            = 'https://launchpad.net/veracrypt/trunk/1.26.7/+download/VeraCrypt_Setup_x64_1.26.7.msi'
  silentArgs     = '/qb /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`" ACCEPTLICENSE=YES'
  validExitCodes = @(0)
  softwareName   = 'VeraCrypt*'
  checksum       = 'c802dcdda02e9a7a3f52645bf90285d3055c76038dc760131192cc23327ca8f8'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
