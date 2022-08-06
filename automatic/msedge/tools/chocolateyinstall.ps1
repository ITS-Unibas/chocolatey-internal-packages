$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'msedge'
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType       = 'msi'
  url            = 'https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/ae74ef31-bf5b-4f40-85c4-3ffbaffa865f/MicrosoftEdgeEnterpriseX64.msi'
  silentArgs     = '/quiet /norestart'
  validExitCodes = @(0)
  softwareName   = 'edge*'
  checksum       = '93ABAA78D6F3BDD3D6B67B6452FE3C023F4FC240547B61F729A4DB5D511AFFF9'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
