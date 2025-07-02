$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'msedge'
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType       = 'msi'
  url            = 'https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/bfe41b4a-0110-4788-b5ea-f0ccf2a73c4e/MicrosoftEdgeEnterpriseX64.msi'
  silentArgs     = '/quiet /norestart'
  validExitCodes = @(0)
  softwareName   = 'edge*'
  checksum       = '1879F5645C1C3B01EF088B204A863140F6566EFD117B75B5C628FCC7D0DCEC24'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
