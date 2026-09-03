$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'msedge'
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType       = 'msi'
  url            = 'https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/c4921788-0a24-453a-a265-f0499bb3135b/MicrosoftEdgeEnterpriseX64.msi'
  silentArgs     = '/quiet /norestart'
  validExitCodes = @(0)
  softwareName   = 'edge*'
  checksum       = '093D7CBE7019C7504446599632DD984DCE567DCB96604F14E4384C2C1420239B'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
