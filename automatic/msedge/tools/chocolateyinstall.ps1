$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'msedge'
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType       = 'msi'
  url            = 'https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/f9f5e847-b297-4ae6-899b-428b17714bea/MicrosoftEdgeEnterpriseX64.msi'
  silentArgs     = '/quiet /norestart'
  validExitCodes = @(0)
  softwareName   = 'edge*'
  checksum       = '7C3B3AC6CC7034B94EC61303C55844D7DC2E06C7830295B54790607E67110324'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
