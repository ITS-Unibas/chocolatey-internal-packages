$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'msedge'
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType       = 'msi'
  url            = 'https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/d2878f17-a0a4-4c3c-8796-d65e8c755c70/MicrosoftEdgeEnterpriseX64.msi'
  silentArgs     = '/quiet /norestart'
  validExitCodes = @(0)
  softwareName   = 'edge*'
  checksum       = 'E9A9CF05CD12D28ABB6CCAFBB82A573FB08D5E9145B83AE789C79AF098049A60'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
