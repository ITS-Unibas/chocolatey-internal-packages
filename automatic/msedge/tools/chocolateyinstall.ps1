$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'msedge'
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType       = 'msi'
  url            = 'https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/47c03a8a-b015-43b1-b174-80dd7c909367/MicrosoftEdgeEnterpriseX64.msi'
  silentArgs     = '/quiet /norestart'
  validExitCodes = @(0)
  softwareName   = 'edge*'
  checksum       = '66894A0818EAD686DDA46A55E48D9C0C558AFED414D352C78C6C819C6AFECE63'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
