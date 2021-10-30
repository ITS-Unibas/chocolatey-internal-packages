$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'msedge'
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType       = 'msi'
  url            = 'https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/95db1c39-9ea5-496e-8f92-edc6d4f8c5a3/MicrosoftEdgeEnterpriseX64.msi'
  silentArgs     = '/quiet /norestart'
  validExitCodes = @(0)
  softwareName   = 'edge*'
  checksum       = '7FF47C76BB4F5A077720370682EAA49AB0F124F56E540F8D0594C1F46FD6A41A'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
