$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'laps'
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType       = 'msi'
  url            = 'https://download.microsoft.com/download/C/7/A/C7AAD914-A8A6-4904-88A1-29E657445D03/LAPS.x64.msi'
  silentArgs     = '/quiet /norestart'
  validExitCodes = @(0, 3010)
  softwareName   = 'Local Administrator Password Solution*'
  checksum       = ''
  checksumType   = 'md5'
}

Install-ChocolateyPackage @packageArgs
