$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'msedge'
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType       = 'msi'
  url            = 'https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/48092499-6d65-4b3d-b75c-01aa52a8d08c/MicrosoftEdgeEnterpriseX64.msi'
  silentArgs     = '/quiet /norestart'
  validExitCodes = @(0)
  softwareName   = 'edge*'
  checksum       = 'BE8B36B449A454D0D24C164B041A2DB2B689A8C3647CFB9FE104977E365677D0'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
