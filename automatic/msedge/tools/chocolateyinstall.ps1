$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'msedge'
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType       = 'msi'
  url            = 'https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/8ec28e1e-d2ae-4d26-b1e6-324aa5318db1/MicrosoftEdgeEnterpriseX64.msi'
  silentArgs     = '/quiet /norestart'
  validExitCodes = @(0)
  softwareName   = 'edge*'
  checksum       = '32E2FEA574B96B50DE3DBF1EB817A8643E2A0E07D6DEDE974262BE71E14613E9'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
