$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'msedge'
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType       = 'msi'
  url            = 'https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/845ba9ba-f72e-4293-aaec-95ea17b356cb/MicrosoftEdgeEnterpriseX64.msi'
  silentArgs     = '/quiet /norestart'
  validExitCodes = @(0)
  softwareName   = 'edge*'
  checksum       = 'C8EDF20ECBFDF272C5BB7174ED5FC725B243486D9192E8ABC460EF4CED916EE8'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
