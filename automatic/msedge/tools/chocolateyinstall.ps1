$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'msedge'
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType       = 'msi'
  url            = 'https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/222659df-94a1-47d7-a729-331590156dcc/MicrosoftEdgeEnterpriseX64.msi'
  silentArgs     = '/quiet /norestart'
  validExitCodes = @(0)
  softwareName   = 'edge*'
  checksum       = '93602094E8C19D60CF0792736B9DC0B84A44937670981E9AA048C325E4E2764F'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
