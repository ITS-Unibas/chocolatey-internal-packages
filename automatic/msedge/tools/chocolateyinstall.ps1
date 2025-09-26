$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'msedge'
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType       = 'msi'
  url            = 'https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/84c9e323-3f78-476c-8f29-68fb27fcd9c4/MicrosoftEdgeEnterpriseX64.msi'
  silentArgs     = '/quiet /norestart'
  validExitCodes = @(0)
  softwareName   = 'edge*'
  checksum       = '5817333B0369C2446261B2ADDE30CE694714C9CD8F5BB9912A9284F1A215F2BE'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
