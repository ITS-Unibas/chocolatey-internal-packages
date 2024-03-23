$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'msedge'
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType       = 'msi'
  url            = 'https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/e795c26d-39f5-458f-a9af-73c72dd910bb/MicrosoftEdgeEnterpriseX64.msi'
  silentArgs     = '/quiet /norestart'
  validExitCodes = @(0)
  softwareName   = 'edge*'
  checksum       = '51642D33B1628BFC1947C161A43A2D94CE0D5677998D3C96FE8B3DEDE1EEC36A'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
