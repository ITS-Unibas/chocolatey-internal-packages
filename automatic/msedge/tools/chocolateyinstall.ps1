$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'msedge'
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType       = 'msi'
  url            = 'https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/4d4eb722-dbb0-4b84-931d-244d8a29691d/MicrosoftEdgeEnterpriseX64.msi'
  silentArgs     = '/quiet /norestart'
  validExitCodes = @(0)
  softwareName   = 'edge*'
  checksum       = '4168A1FD995636B7A0B4CD2236249A9AE5C15026178F8FD42DAC051249321190'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
