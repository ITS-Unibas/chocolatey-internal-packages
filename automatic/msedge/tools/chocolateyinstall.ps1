$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'msedge'
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType       = 'msi'
  url            = 'https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/f626650a-cf6a-4f73-ab30-3889c621001f/MicrosoftEdgeEnterpriseX64.msi'
  silentArgs     = '/quiet /norestart'
  validExitCodes = @(0)
  softwareName   = 'edge*'
  checksum       = 'B0F4DA37379877D8B982E8E08E180F1E62511E707E151EDC7E376B639A5D2C18'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
