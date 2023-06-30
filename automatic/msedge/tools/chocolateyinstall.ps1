$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'msedge'
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType       = 'msi'
  url            = 'https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/a559e5fe-83de-4309-9079-97906d3c655a/MicrosoftEdgeEnterpriseX64.msi'
  silentArgs     = '/quiet /norestart'
  validExitCodes = @(0)
  softwareName   = 'edge*'
  checksum       = '580B2617312478721B79C0E284580959C45A8951095589AC62E848FC3ED6C95C'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
