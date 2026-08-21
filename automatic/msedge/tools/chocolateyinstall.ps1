$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'msedge'
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType       = 'msi'
  url            = 'https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/d209ad46-3748-45ee-9a0f-826275ced29c/MicrosoftEdgeEnterpriseX64.msi'
  silentArgs     = '/quiet /norestart'
  validExitCodes = @(0)
  softwareName   = 'edge*'
  checksum       = '46DCCCEE1669F746DD527561CBD25E5B049333117A6996BA0ED9C14275656CEF'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
