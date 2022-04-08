$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'msedge'
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType       = 'msi'
  url            = 'https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/8beaa4da-9e68-4e9c-94d8-1a67395985b7/MicrosoftEdgeEnterpriseX64.msi'
  silentArgs     = '/quiet /norestart'
  validExitCodes = @(0)
  softwareName   = 'edge*'
  checksum       = 'B3D86B9F2A4868BA3129A4B62CB5935454136EE33D35AB891701E56A1FC93152'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
