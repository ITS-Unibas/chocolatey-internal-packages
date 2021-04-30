$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'msedge'
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType       = 'msi'
  url            = 'https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/668d0688-45de-4ee1-ba7c-0c7804ef4a21/MicrosoftEdgeEnterpriseX64.msi'
  silentArgs     = '/quiet /norestart'
  validExitCodes = @(0)
  softwareName   = 'edge*'
  checksum       = '8E221F5FE60E931F165C96EF9AEFFE755CA73C575B128174748C97DF47F038A2'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
