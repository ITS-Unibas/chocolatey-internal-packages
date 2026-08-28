$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'msedge'
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType       = 'msi'
  url            = 'https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/dd96e247-54fb-4e65-bc78-514b4b7ead4c/MicrosoftEdgeEnterpriseX64.msi'
  silentArgs     = '/quiet /norestart'
  validExitCodes = @(0)
  softwareName   = 'edge*'
  checksum       = '17B704410AE47E33F830230503AFFED39BA8ED36356E90F0CF6759231543A22C'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
