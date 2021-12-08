$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'unibas-veracrypt'
  fileType       = 'msi'
  url            = ''
  silentArgs     = '/quiet /norestart'
  validExitCodes = @(0)
  softwareName   = 'VeraCrypt*'
  checksum       = ''
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
