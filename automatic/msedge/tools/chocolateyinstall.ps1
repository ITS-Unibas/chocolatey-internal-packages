$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'msedge'
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType       = 'msi'
  url            = 'https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/4726286f-d08f-4d1c-9d86-8cc88d8ca208/MicrosoftEdgeEnterpriseX64.msi'
  silentArgs     = '/quiet /norestart'
  validExitCodes = @(0)
  softwareName   = 'edge*'
  checksum       = '255E7642DC13CD2F2E6467E8D27AD6D64466181038EFAB58257E4FB2E9AA3FE8'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
