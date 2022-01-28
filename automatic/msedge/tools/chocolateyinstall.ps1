$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'msedge'
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType       = 'msi'
  url            = 'https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/dbdd4903-2893-48c6-bd53-a3f03a424e01/MicrosoftEdgeEnterpriseX64.msi'
  silentArgs     = '/quiet /norestart'
  validExitCodes = @(0)
  softwareName   = 'edge*'
  checksum       = 'BC982A9A7D1AA2066871FA2EAADBF1EA218C2143B771EF7531B63FFC8E461434'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
