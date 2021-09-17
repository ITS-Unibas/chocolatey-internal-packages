$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'msedge'
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType       = 'msi'
  url            = 'https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/ffabbccd-369e-4c5d-a541-85e6d18da094/MicrosoftEdgeEnterpriseX64.msi'
  silentArgs     = '/quiet /norestart'
  validExitCodes = @(0)
  softwareName   = 'edge*'
  checksum       = 'E7FC61A65D096054E91B54264D3DE8487CC316E81094E7233346471DBBB37CF3'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
