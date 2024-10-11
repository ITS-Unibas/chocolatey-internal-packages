$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'msedge'
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType       = 'msi'
  url            = 'https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/e74d9298-9023-4078-9cab-aea5122299da/MicrosoftEdgeEnterpriseX64.msi'
  silentArgs     = '/quiet /norestart'
  validExitCodes = @(0)
  softwareName   = 'edge*'
  checksum       = 'BAA36096A6F8E649587C5F93A2EDC8F3B528D6891867A493DB540B9BA5786D08'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
