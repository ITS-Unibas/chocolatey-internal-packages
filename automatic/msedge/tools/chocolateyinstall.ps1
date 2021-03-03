$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'msedge'
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType       = 'msi'
  url            = 'https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/4ee0c0fd-bd10-4d6c-b6ef-cb987b248b29/MicrosoftEdgeEnterpriseX64.msi'
  silentArgs     = '/quiet /norestart'
  validExitCodes = @(0)
  softwareName   = 'edge*'
  checksum       = '3CA9850153E81DE6B6C52F1B5AE3763F1C37FF87D41A35E68C261D53F5AF017C'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
