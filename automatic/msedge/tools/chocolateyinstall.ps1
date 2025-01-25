$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'msedge'
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType       = 'msi'
  url            = 'https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/5f75595b-78e7-4b48-8069-ad155e73a457/MicrosoftEdgeEnterpriseX64.msi'
  silentArgs     = '/quiet /norestart'
  validExitCodes = @(0)
  softwareName   = 'edge*'
  checksum       = 'FB846919055B5F1A6682EAF7208D98C21CB94D639AE5DD8443D82864A393EF8A'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
