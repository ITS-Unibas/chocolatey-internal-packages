$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'msedge'
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType       = 'msi'
  url            = 'https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/d620a2bb-7a1e-4b55-ae04-0e54b88916d5/MicrosoftEdgeEnterpriseX64.msi'
  silentArgs     = '/quiet /norestart'
  validExitCodes = @(0)
  softwareName   = 'edge*'
  checksum       = 'B423114BE7FB58889CA5A8AC4F4593A87C97A847E9D39F225D7EF98F9D96A6E7'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
