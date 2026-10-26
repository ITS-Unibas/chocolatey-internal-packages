$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'msedge'
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType       = 'msi'
  url            = 'https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/43a4cadd-6bb0-4325-83ba-ce03006a0b00/MicrosoftEdgeEnterpriseX64.msi'
  silentArgs     = '/quiet /norestart'
  validExitCodes = @(0)
  softwareName   = 'edge*'
  checksum       = 'F7BC427C4D26AEFE12BD492A24959CC6CA328AEA2851614637D7133CAE329071'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
