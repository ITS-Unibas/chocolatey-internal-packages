$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'msedge'
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType       = 'msi'
  url            = 'https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/656303d3-47a8-4ae2-b95f-f4a2ab3f4427/MicrosoftEdgeEnterpriseX64.msi'
  silentArgs     = '/quiet /norestart'
  validExitCodes = @(0)
  softwareName   = 'edge*'
  checksum       = 'FE81BB6F320E4185A6D8C17B591DA7FEAEF4088B220C0E9A46BE1B62492FD0B3'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
