$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'msedge'
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType       = 'msi'
  url            = 'https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/39889510-89f2-4434-aebd-8162488e0f5f/MicrosoftEdgeEnterpriseX64.msi'
  silentArgs     = '/quiet /norestart'
  validExitCodes = @(0)
  softwareName   = 'edge*'
  checksum       = 'A2AB18B98DE70A41F2C92F23FFF4F0B1489AFA677666036FC91811D4478A5E03'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
