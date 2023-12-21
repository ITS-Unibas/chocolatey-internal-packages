$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'msedge'
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType       = 'msi'
  url            = 'https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/5620865e-aa89-4c07-a212-9b30efe0effc/MicrosoftEdgeEnterpriseX64.msi'
  silentArgs     = '/quiet /norestart'
  validExitCodes = @(0)
  softwareName   = 'edge*'
  checksum       = '8A0F9F3DB94FCE541348A5E34A3714FFA0666D6B01A61572022B4D5E1FAEA403'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
