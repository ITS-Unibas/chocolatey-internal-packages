$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'msedge'
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType       = 'msi'
  url            = 'https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/5838c4cb-c4e1-40ec-af9a-0a5f8cd78e24/MicrosoftEdgeEnterpriseX64.msi'
  silentArgs     = '/quiet /norestart'
  validExitCodes = @(0)
  softwareName   = 'edge*'
  checksum       = 'A3DC0B3F584A911F4FC90D8603F97FC873ADC0DEC7A42F6FB87D07E784C80BD4'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
