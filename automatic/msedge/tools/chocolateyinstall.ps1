$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'msedge'
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType       = 'msi'
  url            = 'https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/72b00a3a-11ef-4836-ad83-87c4cb633d84/MicrosoftEdgeEnterpriseX64.msi'
  silentArgs     = '/quiet /norestart'
  validExitCodes = @(0)
  softwareName   = 'edge*'
  checksum       = '3F2E32A92C58949C13413F4EB00F9DFE0668B5F1A83B781FF7058A8F5A5C4502'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
