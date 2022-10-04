$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'msedge'
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType       = 'msi'
  url            = 'https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/3eaf7d3e-0c23-4195-b715-5d45ff3f6b1c/MicrosoftEdgeEnterpriseX64.msi'
  silentArgs     = '/quiet /norestart'
  validExitCodes = @(0)
  softwareName   = 'edge*'
  checksum       = '2DD0F5BFEF61F38FA775C89F1E1643328C9CBFB4A32A735CCC817D2030B16EE0'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
