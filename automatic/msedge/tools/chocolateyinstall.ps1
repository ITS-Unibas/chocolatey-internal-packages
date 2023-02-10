$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'msedge'
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType       = 'msi'
  url            = 'https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/cae8ab77-630c-402e-8fac-829629b974be/MicrosoftEdgeEnterpriseX64.msi'
  silentArgs     = '/quiet /norestart'
  validExitCodes = @(0)
  softwareName   = 'edge*'
  checksum       = 'A141B26B62A00759E6F1381C50F952CCED68B567E8CFA5618445BEA7CB76F07B'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
