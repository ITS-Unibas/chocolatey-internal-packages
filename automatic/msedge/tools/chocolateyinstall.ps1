$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'msedge'
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType       = 'msi'
  url            = 'https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/0a8155d6-0937-4937-8712-1930f09598eb/MicrosoftEdgeEnterpriseX64.msi'
  silentArgs     = '/quiet /norestart'
  validExitCodes = @(0)
  softwareName   = 'edge*'
  checksum       = '072908CF9AD135D53CA8F8C54FC2B165ED70313854BEBDA90EB7173F1006B7AF'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
