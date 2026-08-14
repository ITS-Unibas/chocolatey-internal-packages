$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'msedge'
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType       = 'msi'
  url            = 'https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/0fb19a65-6cdd-467f-bce1-971519a15438/MicrosoftEdgeEnterpriseX64.msi'
  silentArgs     = '/quiet /norestart'
  validExitCodes = @(0)
  softwareName   = 'edge*'
  checksum       = 'E59838EF165D6824DC077CFC0E0C58EFB9BF4929435960EE62835CD20E16AC59'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
