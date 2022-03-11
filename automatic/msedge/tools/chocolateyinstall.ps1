$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'msedge'
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType       = 'msi'
  url            = 'https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/d0dc21e6-4d66-42ba-bef3-0f24d9afc835/MicrosoftEdgeEnterpriseX64.msi'
  silentArgs     = '/quiet /norestart'
  validExitCodes = @(0)
  softwareName   = 'edge*'
  checksum       = '0CFEC4C2B6262A5AE0814428C2B034C6A4B049897D2A6EA13D49C18F62D36B0D'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
