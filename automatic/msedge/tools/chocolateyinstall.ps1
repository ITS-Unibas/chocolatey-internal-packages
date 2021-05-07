$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'msedge'
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType       = 'msi'
  url            = 'https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/8193a389-7b21-4a45-81df-ebd60534fa5c/MicrosoftEdgeEnterpriseX64.msi'
  silentArgs     = '/quiet /norestart'
  validExitCodes = @(0)
  softwareName   = 'edge*'
  checksum       = '702439AC397F25832E39E8EF3E7F389B4898A5BB5B323A0095AB0DF2E8061BF3'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
