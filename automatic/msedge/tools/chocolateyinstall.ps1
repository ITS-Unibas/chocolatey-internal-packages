$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'msedge'
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType       = 'msi'
  url            = 'https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/fb1ff0a0-23fc-4121-97c4-68eb0f54bfd8/MicrosoftEdgeEnterpriseX64.msi'
  silentArgs     = '/quiet /norestart'
  validExitCodes = @(0)
  softwareName   = 'edge*'
  checksum       = 'B13AB75AB0175A242D4D2B95E91A6E019B6AC5ECCB270EE40D565D0856B060DD'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
