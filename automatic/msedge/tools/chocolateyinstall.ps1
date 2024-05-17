$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'msedge'
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType       = 'msi'
  url            = 'https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/e3a55f38-446d-4a35-9e82-6580ca856dee/MicrosoftEdgeEnterpriseX64.msi'
  silentArgs     = '/quiet /norestart'
  validExitCodes = @(0)
  softwareName   = 'edge*'
  checksum       = '89C9C545723DDFE7871A116B0822684D90FAE2D753B25B59E17E467DE87FCD76'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
