$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'msedge'
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType       = 'msi'
  url            = 'https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/f67f7e55-dff2-4028-b3ef-245635752c25/MicrosoftEdgeEnterpriseX64.msi'
  silentArgs     = '/quiet /norestart'
  validExitCodes = @(0)
  softwareName   = 'edge*'
  checksum       = 'FF636EFE2EA13B1B9BD12118C80ED8D8ECC686EE29E64452BD93EECE540F20B6'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
