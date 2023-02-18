$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'msedge'
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType       = 'msi'
  url            = 'https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/1a9eddb0-812f-4e14-a746-33b2ced26b6a/MicrosoftEdgeEnterpriseX64.msi'
  silentArgs     = '/quiet /norestart'
  validExitCodes = @(0)
  softwareName   = 'edge*'
  checksum       = '7B83284F45FC936D73BE622FE86728EA7307142C58AFCBA4915DCB23D6FCAF05'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
