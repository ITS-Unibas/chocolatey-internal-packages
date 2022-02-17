$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'msedge'
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType       = 'msi'
  url            = 'https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/ec0b9dcc-2006-42ef-baf2-10c993bc326e/MicrosoftEdgeEnterpriseX64.msi'
  silentArgs     = '/quiet /norestart'
  validExitCodes = @(0)
  softwareName   = 'edge*'
  checksum       = '548A94B1A01D7558CEE08538B855F55B34182544920A7DCE3B6BF501CDA48AED'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
