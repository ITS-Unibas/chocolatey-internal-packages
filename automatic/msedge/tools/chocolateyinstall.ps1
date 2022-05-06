$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'msedge'
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType       = 'msi'
  url            = 'https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/71c25d04-9596-4481-90c5-a1070a31c64b/MicrosoftEdgeEnterpriseX64.msi'
  silentArgs     = '/quiet /norestart'
  validExitCodes = @(0)
  softwareName   = 'edge*'
  checksum       = '0628F32D2C0E448791927497CF1E0DAB0B5B025053BC6CF5BD8D8D9000304A3B'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
