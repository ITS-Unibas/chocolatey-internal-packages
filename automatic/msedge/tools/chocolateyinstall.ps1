$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'msedge'
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType       = 'msi'
  url            = 'https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/e2405480-9cf0-4871-b3bf-ba446777d994/MicrosoftEdgeEnterpriseX64.msi'
  silentArgs     = '/quiet /norestart'
  validExitCodes = @(0)
  softwareName   = 'edge*'
  checksum       = 'B1E95D49A0EECE1686C32EA83574F013EB84413CA1B3F2247472773224BF1360'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
