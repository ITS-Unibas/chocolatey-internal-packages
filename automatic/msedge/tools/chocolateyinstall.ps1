$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'msedge'
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType       = 'msi'
  url            = 'https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/91731797-32c8-494b-ba04-1083d8ebaf73/MicrosoftEdgeEnterpriseX64.msi'
  silentArgs     = '/quiet /norestart'
  validExitCodes = @(0)
  softwareName   = 'edge*'
  checksum       = '15F1ECC09251FF7D516B5B1BD4B48E07434A0546C6FB8822BEED1026DB5D4975'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
