$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'msedge'
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType       = 'msi'
  url            = 'https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/2aa9ba2a-75b1-4e23-bd53-7a784246c1a3/MicrosoftEdgeEnterpriseX64.msi'
  silentArgs     = '/quiet /norestart'
  validExitCodes = @(0)
  softwareName   = 'edge*'
  checksum       = '1BB4BF20B8EC845351EDA1AD90C9FB20F03F3DF47681A9F59E4EFD4DCC6290E3'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
