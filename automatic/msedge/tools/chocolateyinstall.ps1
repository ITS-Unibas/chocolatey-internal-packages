$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'msedge'
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType       = 'msi'
  url            = 'https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/49934f28-c45e-48cc-8f03-4ddf758e2050/MicrosoftEdgeEnterpriseX64.msi'
  silentArgs     = '/quiet /norestart'
  validExitCodes = @(0)
  softwareName   = 'edge*'
  checksum       = 'AD7E26E155DF31E3171E7F3ABFA504C6B9346A633DCD963093EED992070C0BEF'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
