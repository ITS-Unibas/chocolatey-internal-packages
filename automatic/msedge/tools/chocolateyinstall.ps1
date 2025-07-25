$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'msedge'
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType       = 'msi'
  url            = 'https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/41d396da-7ece-4adc-bcb3-f9d8355671fa/MicrosoftEdgeEnterpriseX64.msi'
  silentArgs     = '/quiet /norestart'
  validExitCodes = @(0)
  softwareName   = 'edge*'
  checksum       = '5ACFB39675647DCE404F11D0495C46578E5B22BD760EC29D368994C120C1A1DE'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
