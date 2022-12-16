$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'msedge'
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType       = 'msi'
  url            = 'https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/92bc3738-b5d1-4fe2-8359-695b6d17661d/MicrosoftEdgeEnterpriseX64.msi'
  silentArgs     = '/quiet /norestart'
  validExitCodes = @(0)
  softwareName   = 'edge*'
  checksum       = 'F83E437302C1C9CECC7E9F133DB4CD649CF14A4B4776503CD02C0A0CF5838E70'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
