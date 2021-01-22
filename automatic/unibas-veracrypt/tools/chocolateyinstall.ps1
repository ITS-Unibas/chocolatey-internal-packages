$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'unibas-veracrypt'
  fileType       = 'msi'
  url            = 'https://launchpad.net/veracrypt/trunk/1.24-update7/+download/VeraCrypt%20Setup%201.24-Update7.exe'
  silentArgs     = '/quiet /norestart'
  validExitCodes = @(0)
  softwareName   = 'VeraCrypt*'
  checksum       = '699c48f2030bd3af1cdae0a4d51372127c82057f8a0f9e5c1b578698da4c6a1d'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
