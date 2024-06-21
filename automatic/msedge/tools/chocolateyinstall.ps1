$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'msedge'
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType       = 'msi'
  url            = 'https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/af059af6-6a6c-4b07-9654-4312661f4c29/MicrosoftEdgeEnterpriseX64.msi'
  silentArgs     = '/quiet /norestart'
  validExitCodes = @(0)
  softwareName   = 'edge*'
  checksum       = 'FBAAB7F1C032F9FA45D8499D967D2AD110B8E33F043FC5D9CD9FEA4B83EC0579'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
