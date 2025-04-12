$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'msedge'
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType       = 'msi'
  url            = 'https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/f509377e-81d5-49b0-a02d-89088b71ceb7/MicrosoftEdgeEnterpriseX64.msi'
  silentArgs     = '/quiet /norestart'
  validExitCodes = @(0)
  softwareName   = 'edge*'
  checksum       = '3B33668CE0C43E59E93D4D7D9EC2C30C658C19F85BE0E3287BDD225D07A49EF9'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
