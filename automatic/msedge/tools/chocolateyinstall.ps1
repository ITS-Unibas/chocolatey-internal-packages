$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'msedge'
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType       = 'msi'
  url            = 'https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/6dbb32b1-a599-430b-bdbc-449ca5e79852/MicrosoftEdgeEnterpriseX64.msi'
  silentArgs     = '/quiet /norestart'
  validExitCodes = @(0)
  softwareName   = 'edge*'
  checksum       = '6FC65B9E52FDC92157398454B80EF8756F884198AB6907FC4E018854B9DD24E8'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
