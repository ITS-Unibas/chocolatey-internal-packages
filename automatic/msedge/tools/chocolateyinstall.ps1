$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'msedge'
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType       = 'msi'
  url            = 'https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/9efbbdd9-92e6-4cb8-be4e-0874a6b21343/MicrosoftEdgeEnterpriseX64.msi'
  silentArgs     = '/quiet /norestart'
  validExitCodes = @(0)
  softwareName   = 'edge*'
  checksum       = '563EB4286A821482704A060915F7A7D9231EB373B603CE681E02834E248491E8'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
