$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'msedge'
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType       = 'msi'
  url            = 'https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/f847cfca-a675-46a5-a87f-d0e60aba476d/MicrosoftEdgeEnterpriseX64.msi'
  silentArgs     = '/quiet /norestart'
  validExitCodes = @(0)
  softwareName   = 'edge*'
  checksum       = 'CB0FE30B2B443BE973C0854CDB259ADC5FFF66B36DC03C11A09EA6B8191C34D9'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
