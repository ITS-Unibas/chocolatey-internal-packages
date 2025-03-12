$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'msedge'
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType       = 'msi'
  url            = 'https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/ca33e3a4-8841-4d49-81cd-8c2e7c9c66f0/MicrosoftEdgeEnterpriseX64.msi'
  silentArgs     = '/quiet /norestart'
  validExitCodes = @(0)
  softwareName   = 'edge*'
  checksum       = '247FFC084CEA1020834A2E25FD88B8A09D30A7A8E505D5DE693F2713557DAE60'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
