$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'msedge'
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType       = 'msi'
  url            = 'https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/e0625c3b-4b6c-4534-8fde-20c9002a5797/MicrosoftEdgeEnterpriseX64.msi'
  silentArgs     = '/quiet /norestart'
  validExitCodes = @(0)
  softwareName   = 'edge*'
  checksum       = 'DD4DDC9F03DDC6D1CD983748782DAC9BE23FE9050A119D098E21B1E7EC3C6A4F'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
