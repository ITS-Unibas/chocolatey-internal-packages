$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'unibas-veracrypt'
  fileType       = 'msi'
  url            = 'https://launchpad.net/veracrypt/trunk/1.25.4/+download/VeraCrypt%20Setup%201.25.4.exe'
  silentArgs     = '/quiet /norestart'
  validExitCodes = @(0)
  softwareName   = 'VeraCrypt*'
  checksum       = '94efbf75cbd4b526f4030b746ae3d4bbb8741b6629603568478fd10e6930a3a5'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
