$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'msedge'
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType       = 'msi'
  url            = 'https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/35f200dc-46f7-46fc-8f97-f29bf1babe1e/MicrosoftEdgeEnterpriseX64.msi'
  silentArgs     = '/quiet /norestart'
  validExitCodes = @(0)
  softwareName   = 'edge*'
  checksum       = 'F932FCFC47F4B3F00E2620C158953EDAA16D9011B1F9B89EE96DC1A06C8CF5E3'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
