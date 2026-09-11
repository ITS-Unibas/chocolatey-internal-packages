$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'msedge'
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType       = 'msi'
  url            = 'https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/4d637967-3bb7-4c92-8b67-6d91ff264d45/MicrosoftEdgeEnterpriseX64.msi'
  silentArgs     = '/quiet /norestart'
  validExitCodes = @(0)
  softwareName   = 'edge*'
  checksum       = '4388DC0C46B5EC98AEBDF9B78A07F2C70076164F322E20228DC7DE366D60A385'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
