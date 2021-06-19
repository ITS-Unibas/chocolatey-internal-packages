$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'msedge'
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType       = 'msi'
  url            = 'https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/c804076b-9eda-4ab6-b30f-b842fe0efa35/MicrosoftEdgeEnterpriseX64.msi'
  silentArgs     = '/quiet /norestart'
  validExitCodes = @(0)
  softwareName   = 'edge*'
  checksum       = '44CC108BF3EBE4D5F820A2C0A802E3B4835D97F0A6DCAAB8F235D64C453F7DFC'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
