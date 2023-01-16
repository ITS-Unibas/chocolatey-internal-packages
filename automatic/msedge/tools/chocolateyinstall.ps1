$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'msedge'
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType       = 'msi'
  url            = 'https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/dd75b458-0c26-4cf6-a4e2-8972f78ecea6/MicrosoftEdgeEnterpriseX64.msi'
  silentArgs     = '/quiet /norestart'
  validExitCodes = @(0)
  softwareName   = 'edge*'
  checksum       = '7638F0E03548B5104FC33CD071C01399C4092B484A85C662E36AA523595FD980'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
