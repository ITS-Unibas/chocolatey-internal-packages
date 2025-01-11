$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'msedge'
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType       = 'msi'
  url            = 'https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/c2a6f7b7-2550-4b5b-a9e5-fa3b7f4ddb32/MicrosoftEdgeEnterpriseX64.msi'
  silentArgs     = '/quiet /norestart'
  validExitCodes = @(0)
  softwareName   = 'edge*'
  checksum       = '4CB2EB9A66BB16A0E9A3FFC05123A1759B266547438C02AF2725B0B5F4CE8523'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
