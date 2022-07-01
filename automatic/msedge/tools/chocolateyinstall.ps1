$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'msedge'
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType       = 'msi'
  url            = 'https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/c96b75fd-157d-4494-9ffd-d299a0b9dd9d/MicrosoftEdgeEnterpriseX64.msi'
  silentArgs     = '/quiet /norestart'
  validExitCodes = @(0)
  softwareName   = 'edge*'
  checksum       = 'DC48DEA2F274BA61BC2FD0A378EE0A7AAD2545170671D6A46254C91CFB7C400A'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
