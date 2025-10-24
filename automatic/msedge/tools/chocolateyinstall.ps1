$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'msedge'
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType       = 'msi'
  url            = 'https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/7c2821c1-1f64-440d-bd8b-a9f566748f12/MicrosoftEdgeEnterpriseX64.msi'
  silentArgs     = '/quiet /norestart'
  validExitCodes = @(0)
  softwareName   = 'edge*'
  checksum       = '37214525E8A573AD9A8E4E8EF3CD7B3452496A13FF4611471FE2CA62ED51CF6E'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
