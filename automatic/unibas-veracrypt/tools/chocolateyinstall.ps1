$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'unibas-veracrypt'
  fileType       = 'msi'
  url            = 'https://launchpad.net/veracrypt/trunk/1.25.4/+download/VeraCrypt_Setup_x64_1.25.4.msi'
  silentArgs     = '/qb /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`" ACCEPTLICENSE=YES'
  validExitCodes = @(0)
  softwareName   = 'VeraCrypt*'
  checksum       = '31b51cad12d7ec6eea71c7bd0a834bd516c89c6e57635ff7933391c49068e358'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
