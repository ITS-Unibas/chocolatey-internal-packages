$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'msedge'
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType       = 'msi'
  url            = 'https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/c2bf670e-30a9-46a9-b0e2-9ec403428385/MicrosoftEdgeEnterpriseX64.msi'
  silentArgs     = '/quiet /norestart'
  validExitCodes = @(0)
  softwareName   = 'edge*'
  checksum       = '8BFCCAF626627E37B72E3E57108530B1479FAC5710F939E528866CC1095CA172'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
