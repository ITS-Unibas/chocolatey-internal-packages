$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'msedge'
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType       = 'msi'
  url            = 'https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/2b3d9012-14cb-465f-a289-4aba3825cc11/MicrosoftEdgeEnterpriseX64.msi'
  silentArgs     = '/quiet /norestart'
  validExitCodes = @(0)
  softwareName   = 'edge*'
  checksum       = '30D779ACA6101B7F3BB8BA4CD96E3E9415ACAC8055394C1B33366C04166E1324'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
