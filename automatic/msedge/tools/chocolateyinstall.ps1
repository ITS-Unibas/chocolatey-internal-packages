$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'msedge'
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType       = 'msi'
  url            = 'https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/e23c074b-1771-4f3a-91b6-5cb01e793912/MicrosoftEdgeEnterpriseX64.msi'
  silentArgs     = '/quiet /norestart'
  validExitCodes = @(0)
  softwareName   = 'edge*'
  checksum       = 'D46148C336F30B27F7D79765EE2C67E799E2B240DF4417FE4733902AA2C1D738'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
