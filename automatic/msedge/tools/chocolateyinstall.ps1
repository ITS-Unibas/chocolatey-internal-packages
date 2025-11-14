$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'msedge'
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType       = 'msi'
  url            = 'https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/780ad682-9a18-4b95-bf0b-3402a54326ec/MicrosoftEdgeEnterpriseX64.msi'
  silentArgs     = '/quiet /norestart'
  validExitCodes = @(0)
  softwareName   = 'edge*'
  checksum       = 'DA44FAD30377A8D8607FC8D27BE720F833FA522A27035A9BFFBD314372167C8E'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
