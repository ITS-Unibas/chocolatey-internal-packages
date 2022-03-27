$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'msedge'
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType       = 'msi'
  url            = 'https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/18e7a93d-4393-4d72-9611-ec93904acc83/MicrosoftEdgeEnterpriseX64.msi'
  silentArgs     = '/quiet /norestart'
  validExitCodes = @(0)
  softwareName   = 'edge*'
  checksum       = '2AC2CFDFFAB59F23FAF1B2A8A82038193C3EC52F9F783D4EC068DAE384C99412'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
