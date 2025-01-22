$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'unibas-veracrypt'
  fileType       = 'msi'
  url            = 'https://launchpad.net/veracrypt/trunk/1.26.18/+download/VeraCrypt_Setup_x64_1.26.18.msi'
  silentArgs     = '/qb /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`" ACCEPTLICENSE=YES'
  validExitCodes = @(0)
  softwareName   = 'VeraCrypt*'
  checksum       = 'b7d0495453259fffe0b9c5ffba02a4c36614f18dd2ad00c90ef7b95613cb1314'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
