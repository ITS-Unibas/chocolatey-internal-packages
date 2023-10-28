$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'msedge'
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType       = 'msi'
  url            = 'https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/03a80bc5-a7a3-4017-90d1-805907b1da66/MicrosoftEdgeEnterpriseX64.msi'
  silentArgs     = '/quiet /norestart'
  validExitCodes = @(0)
  softwareName   = 'edge*'
  checksum       = 'D0B4815191F9C99FC12C314D3A8D3FC6BA0BC0350FA734B1F41FC3FC1CEE1AD4'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
