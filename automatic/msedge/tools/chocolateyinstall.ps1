$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'msedge'
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType       = 'msi'
  url            = 'https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/5959909f-b83f-4fcb-acda-8bf69ba05d32/MicrosoftEdgeEnterpriseX64.msi'
  silentArgs     = '/quiet /norestart'
  validExitCodes = @(0)
  softwareName   = 'edge*'
  checksum       = '66149576D890BC4DB0EBE928F9389C0F81ED59942D5BB1142689650BA7E3FB42'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
