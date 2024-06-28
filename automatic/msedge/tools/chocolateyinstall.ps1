$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'msedge'
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType       = 'msi'
  url            = 'https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/624ce5ea-33a7-47f1-af28-5c677f0c18bf/MicrosoftEdgeEnterpriseX64.msi'
  silentArgs     = '/quiet /norestart'
  validExitCodes = @(0)
  softwareName   = 'edge*'
  checksum       = '7192F0DB4502EBEE0C2FF1FC3586B31D46804F13FB834358E208ABEE8384A6C8'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
