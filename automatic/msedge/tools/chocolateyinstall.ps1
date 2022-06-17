$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'msedge'
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType       = 'msi'
  url            = 'https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/ccccb4f6-dfab-40be-a4e7-a8008a17846e/MicrosoftEdgeEnterpriseX64.msi'
  silentArgs     = '/quiet /norestart'
  validExitCodes = @(0)
  softwareName   = 'edge*'
  checksum       = '0AD8E74053E4E0680E3ADD4249DEB9CD734CF1C01493C14B0A7C2D6E3C5FB8C7'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
