$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'msedge'
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType       = 'msi'
  url            = 'https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/5cdb292a-ea8a-4aed-b2c5-73e2a74ad28f/MicrosoftEdgeEnterpriseX64.msi'
  silentArgs     = '/quiet /norestart'
  validExitCodes = @(0)
  softwareName   = 'edge*'
  checksum       = '1972C2E7BC8BD2A7C815EABD6C77936CAFF09DD9F214B2100DE5C948504E54B8'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
