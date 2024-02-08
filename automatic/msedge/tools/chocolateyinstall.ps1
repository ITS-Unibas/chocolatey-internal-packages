$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'msedge'
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType       = 'msi'
  url            = 'https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/b0c84f4a-cacc-4b3a-b4da-d8840e7f3c7d/MicrosoftEdgeEnterpriseX64.msi'
  silentArgs     = '/quiet /norestart'
  validExitCodes = @(0)
  softwareName   = 'edge*'
  checksum       = '11A100D161B4FD5D876D5B9EA822D201CC4D6AE43E1EA77192EC62548C3B8B18'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
