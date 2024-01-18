$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'msedge'
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType       = 'msi'
  url            = 'https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/0fe5ee25-0f55-4163-a68c-b6b20c8ace7d/MicrosoftEdgeEnterpriseX64.msi'
  silentArgs     = '/quiet /norestart'
  validExitCodes = @(0)
  softwareName   = 'edge*'
  checksum       = '6149671183C8F9D0906F1BD080D553F11F86DB033CDFD7A6E9A484CE61A2351A'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
