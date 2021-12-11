$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'msedge'
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType       = 'msi'
  url            = 'https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/a7181c9e-b4a9-4005-be41-48f9e19d9639/MicrosoftEdgeEnterpriseX64.msi'
  silentArgs     = '/quiet /norestart'
  validExitCodes = @(0)
  softwareName   = 'edge*'
  checksum       = '76E8CA582105EB7A83766A3F33875E7126771179865BF9DB0449B84B8AE6E61D'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
