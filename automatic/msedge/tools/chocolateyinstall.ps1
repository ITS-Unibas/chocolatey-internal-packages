$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'msedge'
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType       = 'msi'
  url            = 'https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/a8a29c25-2ea1-4ece-9e96-553fc4eb6038/MicrosoftEdgeEnterpriseX64.msi'
  silentArgs     = '/quiet /norestart'
  validExitCodes = @(0)
  softwareName   = 'edge*'
  checksum       = '975B5B5997009B6A8EA9E06F0875106BD81ED3BFDFA65A74412C42CCE2D0C5D7'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
