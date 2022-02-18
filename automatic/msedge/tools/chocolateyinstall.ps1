$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'msedge'
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType       = 'msi'
  url            = 'https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/6a6c1d52-db7d-4a6f-9acb-8bde082025ed/MicrosoftEdgeEnterpriseX64.msi'
  silentArgs     = '/quiet /norestart'
  validExitCodes = @(0)
  softwareName   = 'edge*'
  checksum       = 'EA43C373242EE2EF7F27C99F037A320B774B59495831E7ADE251792BA0B98A34'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
