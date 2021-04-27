$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'msedge'
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType       = 'msi'
  url            = 'https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/a66c98a3-5fa6-42a0-abef-940493bcab77/MicrosoftEdgeEnterpriseX64.msi'
  silentArgs     = '/quiet /norestart'
  validExitCodes = @(0)
  softwareName   = 'edge*'
  checksum       = 'FA22FDBA46D1C0A4E889031256D14FFAEBD516D0BF47955EDFA0463B17DE44DA'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
