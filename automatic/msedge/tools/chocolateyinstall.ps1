$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'msedge'
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType       = 'msi'
  url            = 'https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/d524a684-223c-4353-ac48-352850f50294/MicrosoftEdgeEnterpriseX64.msi'
  silentArgs     = '/quiet /norestart'
  validExitCodes = @(0)
  softwareName   = 'edge*'
  checksum       = '6853A25C265FBFCAA9A0DC8FB22999A4A13AC23954CF8F4A243E6D0E51AFE224'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
