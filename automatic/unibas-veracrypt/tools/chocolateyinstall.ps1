$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'unibas-veracrypt'
  fileType       = 'msi'
  url            = 'https://launchpad.net/veracrypt/trunk/1.25.7/+download/VeraCrypt_Setup_x64_1.25.7.msi'
  silentArgs     = '/qb /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`" ACCEPTLICENSE=YES'
  validExitCodes = @(0)
  softwareName   = 'VeraCrypt*'
  checksum       = '12d999bca2b97a4f268087139d1606183e0cdb11c4b046b6c6dc5f0f965c3fd2'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
