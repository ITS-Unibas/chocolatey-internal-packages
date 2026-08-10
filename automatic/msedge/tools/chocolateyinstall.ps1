$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'msedge'
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType       = 'msi'
  url            = 'https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/f5e477ef-f201-49dd-866a-8e25850421dd/MicrosoftEdgeEnterpriseX64.msi'
  silentArgs     = '/quiet /norestart'
  validExitCodes = @(0)
  softwareName   = 'edge*'
  checksum       = '716B2549EEDF4305B92D149186F878394C8D8B7B743DB0EAAEC773349ED3C273'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
