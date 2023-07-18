$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'msedge'
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType       = 'msi'
  url            = 'https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/fcad0740-e7fc-4a38-80fd-a9f29cdbc6c1/MicrosoftEdgeEnterpriseX64.msi'
  silentArgs     = '/quiet /norestart'
  validExitCodes = @(0)
  softwareName   = 'edge*'
  checksum       = '9B2289087F118EED11A8DCFF5E755B883965E1950B58545B13B7EE4497797D91'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
