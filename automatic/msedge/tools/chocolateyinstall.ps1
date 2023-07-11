$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'msedge'
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType       = 'msi'
  url            = 'https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/3e07e2ae-b73f-43b3-8ec6-a43bfaa2d9ea/MicrosoftEdgeEnterpriseX64.msi'
  silentArgs     = '/quiet /norestart'
  validExitCodes = @(0)
  softwareName   = 'edge*'
  checksum       = '8567916D15F63FAC96ECBE3F29F7806DB229ED4C1E335097AF9F83D9B8E2BF77'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
