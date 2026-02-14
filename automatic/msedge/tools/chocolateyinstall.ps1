$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'msedge'
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType       = 'msi'
  url            = 'https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/e0e65c50-aefd-4612-8e6d-803e4c365065/MicrosoftEdgeEnterpriseX64.msi'
  silentArgs     = '/quiet /norestart'
  validExitCodes = @(0)
  softwareName   = 'edge*'
  checksum       = '7432BEBE29F62316327CF98A784A22D48B8360DB000D481A85FD03E7E0BDAE29'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
