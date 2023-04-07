$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'msedge'
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType       = 'msi'
  url            = 'https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/ccf23a6b-9fdb-4e74-a8f4-d980a498b87d/MicrosoftEdgeEnterpriseX64.msi'
  silentArgs     = '/quiet /norestart'
  validExitCodes = @(0)
  softwareName   = 'edge*'
  checksum       = '8F57346DBC7DA780AF412B70690B15504C3CAD80325507E1A563E6824C486FFF'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
