$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'msedge'
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType       = 'msi'
  url            = 'https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/43db12f1-536d-4813-857d-b3b8696efc84/MicrosoftEdgeEnterpriseX64.msi'
  silentArgs     = '/quiet /norestart'
  validExitCodes = @(0)
  softwareName   = 'edge*'
  checksum       = 'FCA6CAA09E1BB509963D9A05A1EA7B204C59EB4E8968AD2970A49E042F00B678'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
