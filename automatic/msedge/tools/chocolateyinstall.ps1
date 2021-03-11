$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'msedge'
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType       = 'msi'
  url            = 'https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/68da2c76-79a8-4ce2-9d43-1a0c4d775b8e/MicrosoftEdgeEnterpriseX64.msi'
  silentArgs     = '/quiet /norestart'
  validExitCodes = @(0)
  softwareName   = 'edge*'
  checksum       = 'BE95E5F8C8D9B0FA867C5016C8BEAD07835FCF7E25152C539BDDF3F076BDAAFA'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
