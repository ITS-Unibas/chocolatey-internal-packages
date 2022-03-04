$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'msedge'
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType       = 'msi'
  url            = 'https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/bef39902-53a3-4af3-b280-f7cc3a1a4799/MicrosoftEdgeEnterpriseX64.msi'
  silentArgs     = '/quiet /norestart'
  validExitCodes = @(0)
  softwareName   = 'edge*'
  checksum       = 'D0E5A0E9CA6436E3C24763066C8ABECD9D38AA866939C81554D808FC58752659'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
