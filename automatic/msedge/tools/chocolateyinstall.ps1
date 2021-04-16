$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'msedge'
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType       = 'msi'
  url            = 'https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/55585448-a19c-4bde-90a7-1c72bb2ace31/MicrosoftEdgeEnterpriseX64.msi'
  silentArgs     = '/quiet /norestart'
  validExitCodes = @(0)
  softwareName   = 'edge*'
  checksum       = '3F01BA4B7321DF2F2BE13385768FCF48DEB18C6D4DD6272FCCE08EFEEF83704F'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
