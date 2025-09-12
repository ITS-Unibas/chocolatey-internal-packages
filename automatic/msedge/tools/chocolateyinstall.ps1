$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'msedge'
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType       = 'msi'
  url            = 'https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/9a2bd388-8ae9-4e9f-a74b-f201d607d9e1/MicrosoftEdgeEnterpriseX64.msi'
  silentArgs     = '/quiet /norestart'
  validExitCodes = @(0)
  softwareName   = 'edge*'
  checksum       = '61D2E524EFC3EC58808BF634B8A73E529A25DAAA213FB3DF44DF87F0C2CFFA42'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
