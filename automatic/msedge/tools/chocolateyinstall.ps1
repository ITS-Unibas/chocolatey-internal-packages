$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'msedge'
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType       = 'msi'
  url            = 'https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/43dad407-9104-48f5-89ac-7a46dc52ab63/MicrosoftEdgeEnterpriseX64.msi'
  silentArgs     = '/quiet /norestart'
  validExitCodes = @(0)
  softwareName   = 'edge*'
  checksum       = 'ECB7C143F42DA64E91AF536C4A9BCCB6B4F7E063ED5350A81B804FF6C108A035'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
