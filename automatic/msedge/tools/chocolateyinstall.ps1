$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'msedge'
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType       = 'msi'
  url            = 'https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/13114b76-6b2b-4c5e-82f2-1369bc6bbc3b/MicrosoftEdgeEnterpriseX64.msi'
  silentArgs     = '/quiet /norestart'
  validExitCodes = @(0)
  softwareName   = 'edge*'
  checksum       = 'B5EB44FE42070B6FABBC4E3020315C44F57F30A19EC02DD8AB5699EBA8D820B3'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
