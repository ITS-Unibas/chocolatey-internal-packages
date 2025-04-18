$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'msedge'
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType       = 'msi'
  url            = 'https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/083fb1ff-6b5c-487b-ba95-5c61711c3ec2/MicrosoftEdgeEnterpriseX64.msi'
  silentArgs     = '/quiet /norestart'
  validExitCodes = @(0)
  softwareName   = 'edge*'
  checksum       = '71F69528B01EDCB5041E710B51E53602F0ACA6A37AEDE518D99D0DD892DA1E9E'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
