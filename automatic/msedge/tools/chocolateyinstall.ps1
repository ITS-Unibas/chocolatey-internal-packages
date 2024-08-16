$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'msedge'
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType       = 'msi'
  url            = 'https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/8726d95e-f92e-406a-82d7-614b0900aabb/MicrosoftEdgeEnterpriseX64.msi'
  silentArgs     = '/quiet /norestart'
  validExitCodes = @(0)
  softwareName   = 'edge*'
  checksum       = '53C232064D4A296F63A524DB2247F923E058DD7A102AD2B32767CD77A7F77453'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
