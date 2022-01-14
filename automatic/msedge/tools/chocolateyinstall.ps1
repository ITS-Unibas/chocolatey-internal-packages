$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'msedge'
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType       = 'msi'
  url            = 'https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/74afcca4-26d7-4572-ad9d-71fce1ccd55b/MicrosoftEdgeEnterpriseX64.msi'
  silentArgs     = '/quiet /norestart'
  validExitCodes = @(0)
  softwareName   = 'edge*'
  checksum       = 'BC7CBF5A1C1EF90EEAF1166EE7FDDF005581B50D4C0ED27133A485E27990A7B1'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
