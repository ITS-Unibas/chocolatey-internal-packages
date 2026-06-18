$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'msedge'
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType       = 'msi'
  url            = 'https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/8c19fadc-2e0b-4e3c-97a8-b33956b14985/MicrosoftEdgeEnterpriseX64.msi'
  silentArgs     = '/quiet /norestart'
  validExitCodes = @(0)
  softwareName   = 'edge*'
  checksum       = '94B9340286CF255AEA188B7977E2574A42F5DCDB4A73D1AA90B292F9CC850D40'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
