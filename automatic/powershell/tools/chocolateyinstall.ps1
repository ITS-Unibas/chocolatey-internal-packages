$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'powershell'
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType       = 'msi'
  url            = 'https://github.com/PowerShell/PowerShell/releases/download/v7.2.1/PowerShell-7.2.1-win-x64.msi'
  silentArgs     = '/quiet /norestart'
  validExitCodes = @(0)
  softwareName   = 'PowerShell*'
  checksum       = '4BE52CDD6323E4BEBDABD39A1BF65CDFB78953F77FEDE957A8421C0F5F9B2676'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
