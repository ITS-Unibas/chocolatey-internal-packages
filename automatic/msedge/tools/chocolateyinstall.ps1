$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'msedge'
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType       = 'msi'
  url            = 'https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/7a7cd97d-7926-42cb-a900-b09c911bcc76/MicrosoftEdgeEnterpriseX64.msi'
  silentArgs     = '/quiet /norestart'
  validExitCodes = @(0)
  softwareName   = 'edge*'
  checksum       = 'B6779C6812BAA14F1862F8A28C8FD4BC7399D54D1526872AA359A564E12D34E4'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
