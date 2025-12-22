$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'msedge'
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType       = 'msi'
  url            = 'https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/f14840f4-b905-4a62-8b20-b7a2f24512db/MicrosoftEdgeEnterpriseX64.msi'
  silentArgs     = '/quiet /norestart'
  validExitCodes = @(0)
  softwareName   = 'edge*'
  checksum       = 'E041D7134A3933DBC09D4A7BA46049CE465CC7203098FC7B8F3F35451C2C6827'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
