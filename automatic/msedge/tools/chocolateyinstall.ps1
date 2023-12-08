$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'msedge'
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType       = 'msi'
  url            = 'https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/246e4bf2-8ad8-446b-b247-6fa0390a105e/MicrosoftEdgeEnterpriseX64.msi'
  silentArgs     = '/quiet /norestart'
  validExitCodes = @(0)
  softwareName   = 'edge*'
  checksum       = '58629AC21B57AA8C0F0FC5E097D4F84A64EAE914FA210C46F4476190CAEDFE6C'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
