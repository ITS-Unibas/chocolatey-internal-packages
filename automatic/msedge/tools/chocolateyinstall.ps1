$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'msedge'
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType       = 'msi'
  url            = 'https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/2e65d28e-ed30-4d82-bd51-4871d9307087/MicrosoftEdgeEnterpriseX64.msi'
  silentArgs     = '/quiet /norestart'
  validExitCodes = @(0)
  softwareName   = 'edge*'
  checksum       = 'BB01D4CFAD99580816C9FBBA0E25BB159D7FDDD7698492BBCD1D65ADA4386D0D'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
