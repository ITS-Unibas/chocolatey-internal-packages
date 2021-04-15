$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'msedge'
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType       = 'msi'
  url            = 'https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/4f099db1-8164-4a54-8cd5-8ddde2854711/MicrosoftEdgeEnterpriseX64.msi'
  silentArgs     = '/quiet /norestart'
  validExitCodes = @(0)
  softwareName   = 'edge*'
  checksum       = '6DD1D14B1FE9CD84A255A3EE76069571A6CEC5178AB357345B8A34F65E11B1F6'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
