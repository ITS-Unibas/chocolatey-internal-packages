$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'msedge'
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType       = 'msi'
  url            = 'http://dl.delivery.mp.microsoft.com/filestreamingservice/files/0083d4f9-6b4f-4bcc-9c6e-838705f33904/MicrosoftEdgeEnterpriseX64.msi'
  silentArgs     = '/quiet /norestart'
  validExitCodes = @(0)
  softwareName   = 'edge*'
  checksum       = 'C56598919B9BEC994304357242E51F172F09E391C0B9E3420AF7D1580D53CBDF'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
