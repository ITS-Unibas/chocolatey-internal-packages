$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'msedge'
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType       = 'msi'
  url            = 'https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/7924a3fc-0236-4168-9363-b402d6795c37/MicrosoftEdgeEnterpriseX64.msi'
  silentArgs     = '/quiet /norestart'
  validExitCodes = @(0)
  softwareName   = 'edge*'
  checksum       = '8BEF1FC393F1F7E14FEE2C1180837C3C18C8AC26A208F303DA04A666FD8C12B1'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
