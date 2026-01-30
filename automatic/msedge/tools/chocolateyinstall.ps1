$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'msedge'
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType       = 'msi'
  url            = 'https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/17cbcabf-84f9-4081-b05d-ddf9ac6ef15a/MicrosoftEdgeEnterpriseX64.msi'
  silentArgs     = '/quiet /norestart'
  validExitCodes = @(0)
  softwareName   = 'edge*'
  checksum       = 'E998F77833D41D77760B41C97CC5B4B9D7C9E373E1EED5E63A38A1C1A4831828'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
