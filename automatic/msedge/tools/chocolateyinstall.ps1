$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'msedge'
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType       = 'msi'
  url            = 'https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/6fd499c8-6e90-44bd-98b2-a2767463669e/MicrosoftEdgeEnterpriseX64.msi'
  silentArgs     = '/quiet /norestart'
  validExitCodes = @(0)
  softwareName   = 'edge*'
  checksum       = 'FB0CB0426B9DB9F7B8A7B83F65168D5903590B3FC5E37D3D0DAF87F42D5FAC1F'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
