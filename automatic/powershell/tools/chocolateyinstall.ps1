$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'powershell'
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType       = 'msi'
  url            = ''
  silentArgs     = '/quiet /norestart'
  validExitCodes = @(0)
  softwareName   = 'PowerShell*'
  checksum       = ''
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
