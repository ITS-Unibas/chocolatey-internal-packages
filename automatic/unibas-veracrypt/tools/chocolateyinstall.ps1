$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'unibas-veracrypt'
  fileType       = 'msi'
  url            = 'https://launchpad.net/veracrypt/trunk/1.26.20/+download/VeraCrypt_Setup_x64_1.26.20.msi'
  silentArgs     = '/qb /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`" ACCEPTLICENSE=YES'
  validExitCodes = @(0)
  softwareName   = 'VeraCrypt*'
  checksum       = '8cc1f95666fcbab6016c18c36f1e6273308edfceedc535035da911ec090c2236'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
