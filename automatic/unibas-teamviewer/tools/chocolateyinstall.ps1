$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'unibas-teamviewer'
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType       = 'exe'
  url            = ''
  silentArgs     = '/S /norestart'
  validExitCodes = @(0, 1638, 3010)
  softwareName   = 'TeamViewer*'
  checksum       = ''
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
