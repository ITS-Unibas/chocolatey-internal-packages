$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'msedge'
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType       = 'msi'
  url            = 'https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/950e5559-bb85-4d79-98bb-847b22c3700e/MicrosoftEdgeEnterpriseX64.msi'
  silentArgs     = '/quiet /norestart'
  validExitCodes = @(0)
  softwareName   = 'edge*'
  checksum       = '4C54360926BF534D89C85B84B21CEAB100F3E60AF7FEAFD0DEBE465E56CB73A8'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
