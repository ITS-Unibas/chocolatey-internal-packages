$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'msedge'
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType       = 'msi'
  url            = 'https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/85baa1c1-9e49-42cb-89fb-6a0c18e12de2/MicrosoftEdgeEnterpriseX64.msi'
  silentArgs     = '/quiet /norestart'
  validExitCodes = @(0)
  softwareName   = 'edge*'
  checksum       = 'C6DD12FC5DACA0F84C09691D99414FF14C4946A368405CEADF6E905934EFDCBB'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
