$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'msedge'
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType       = 'msi'
  url            = 'https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/55759d14-099c-4334-abb8-129e589bc264/MicrosoftEdgeEnterpriseX64.msi'
  silentArgs     = '/quiet /norestart'
  validExitCodes = @(0)
  softwareName   = 'edge*'
  checksum       = '8A57EBD08A2C7000BE0D2638D0268608A4E1094C3F211AB991C82C17452D42E0'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
