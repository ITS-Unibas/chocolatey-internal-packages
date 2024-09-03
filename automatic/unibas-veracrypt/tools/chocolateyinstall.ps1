$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'unibas-veracrypt'
  fileType       = 'msi'
  url            = 'https://launchpad.net/veracrypt/trunk/1.26.15/+download/VeraCrypt_Setup_x64_1.26.15.msi'
  silentArgs     = '/qb /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`" ACCEPTLICENSE=YES'
  validExitCodes = @(0)
  softwareName   = 'VeraCrypt*'
  checksum       = 'b04253864adad522669ad69e94e55945a0736a8c4aeb6742357228120d342cf7'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
