$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'msedge'
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType       = 'msi'
  url            = 'https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/eabab707-708e-4df2-9443-b340617829de/MicrosoftEdgeEnterpriseX64.msi'
  silentArgs     = '/quiet /norestart'
  validExitCodes = @(0)
  softwareName   = 'edge*'
  checksum       = '63888F4631BEE22E0ED8AD74AD3D4FC0F30F7116296A2734A8C85F7238DFE910'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
