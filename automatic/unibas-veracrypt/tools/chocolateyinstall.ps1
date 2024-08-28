$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'unibas-veracrypt'
  fileType       = 'msi'
  url            = 'https://launchpad.net/veracrypt/trunk/1.26.14/+download/VeraCrypt_Setup_x64_1.26.14.msi'
  silentArgs     = '/qb /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`" ACCEPTLICENSE=YES'
  validExitCodes = @(0)
  softwareName   = 'VeraCrypt*'
  checksum       = '9a29c7b3b911bbc50bc7f41f93c7659ce70599fd19a78aca002bd6e4a8d3e9a4'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
