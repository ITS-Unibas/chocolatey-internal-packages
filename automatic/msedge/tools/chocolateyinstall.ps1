$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'msedge'
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType       = 'msi'
  url            = 'http://dl.delivery.mp.microsoft.com/filestreamingservice/files/cc746716-af14-48fa-a767-5a2e902b6340/MicrosoftEdgeEnterpriseX64.msi'
  silentArgs     = '/quiet /norestart'
  validExitCodes = @(0)
  softwareName   = 'edge*'
  checksum       = '6738DA95DB8BBA0F79D5A8DA24237664A7529E51074B2A97475B3767F4562A68'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
