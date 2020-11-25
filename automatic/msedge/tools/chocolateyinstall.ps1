$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'msedge'
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType       = 'msi'
  url            = 'https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/f656094e-b3ca-4dea-891a-10513a496174/MicrosoftEdgeEnterpriseX64.msi'
  silentArgs     = '/quiet /norestart'
  validExitCodes = @(0)
  softwareName   = 'edge*'
  checksum       = 'BC9CC0743D351658FD674EF36FA8B5FD70D20F03AF6B2476CE67902202160830'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
