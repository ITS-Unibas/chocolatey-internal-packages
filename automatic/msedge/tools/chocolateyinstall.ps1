$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'msedge'
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType       = 'msi'
  url            = 'https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/ab689568-2c42-4b02-a448-6031eeb67a1f/MicrosoftEdgeEnterpriseX64.msi'
  silentArgs     = '/quiet /norestart'
  validExitCodes = @(0)
  softwareName   = 'edge*'
  checksum       = 'B8AA1F31D1D4F7F24FF3074CAB343A5AC2883F6AB941CFE661755A57F93657D2'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
