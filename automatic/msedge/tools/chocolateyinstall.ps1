$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'msedge'
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType       = 'msi'
  url            = 'https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/77ecc2c5-913d-4fb8-90fb-c4353910c525/MicrosoftEdgeEnterpriseX64.msi'
  silentArgs     = '/quiet /norestart'
  validExitCodes = @(0)
  softwareName   = 'edge*'
  checksum       = '2ED22DAE7E0C2A96A3B121433B3E318F2E5CB40542EE4E26BAB46FEFF97663A3'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
