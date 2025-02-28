$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'msedge'
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType       = 'msi'
  url            = 'https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/d06f2e4e-4417-417f-8809-f61da107473c/MicrosoftEdgeEnterpriseX64.msi'
  silentArgs     = '/quiet /norestart'
  validExitCodes = @(0)
  softwareName   = 'edge*'
  checksum       = '7FDE6C2C4AE09AB4080717E46351DA5EB30E5DBE27C1FE4956FB0A3992CAB5B3'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
