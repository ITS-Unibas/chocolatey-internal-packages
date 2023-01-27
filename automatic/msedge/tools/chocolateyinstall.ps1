$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'msedge'
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType       = 'msi'
  url            = 'https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/224f0252-19d5-4a90-90dc-89b3999fa1fa/MicrosoftEdgeEnterpriseX64.msi'
  silentArgs     = '/quiet /norestart'
  validExitCodes = @(0)
  softwareName   = 'edge*'
  checksum       = 'EA1ECCB76CBC59EB085E46DA332B7720252351F4D28FAD2A96B3C70C9F8AB7FF'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
