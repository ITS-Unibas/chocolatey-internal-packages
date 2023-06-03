$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'msedge'
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType       = 'msi'
  url            = 'https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/b093e7f8-101f-469f-b18f-457dd8951667/MicrosoftEdgeEnterpriseX64.msi'
  silentArgs     = '/quiet /norestart'
  validExitCodes = @(0)
  softwareName   = 'edge*'
  checksum       = '4C648313241FAF2745EFBCA827907463E8F7A39A5174759CDE10CDEC75833CD9'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
