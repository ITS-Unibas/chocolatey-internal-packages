$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'msedge'
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType       = 'msi'
  url            = 'https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/b2b23b3a-3ed8-4305-b16b-d670a2be96e8/MicrosoftEdgeEnterpriseX64.msi'
  silentArgs     = '/quiet /norestart'
  validExitCodes = @(0)
  softwareName   = 'edge*'
  checksum       = 'D8B3055D2373918577178AE0BD872DE7BE0ADDD3142062706F102BDABDA706D6'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
