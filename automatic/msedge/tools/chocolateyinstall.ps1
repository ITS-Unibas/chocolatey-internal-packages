$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'msedge'
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType       = 'msi'
  url            = 'https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/baddf6fc-24a8-45d5-955c-70580010effe/MicrosoftEdgeEnterpriseX64.msi'
  silentArgs     = '/quiet /norestart'
  validExitCodes = @(0)
  softwareName   = 'edge*'
  checksum       = '33EFBA971D6A60FAB1531525FC69A64ED9029F93A668F42759FAF3FF182DBD66'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
