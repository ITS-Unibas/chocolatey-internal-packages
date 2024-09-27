$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'msedge'
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType       = 'msi'
  url            = 'https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/d9f1c9e9-d8d3-470a-8854-4ba1658cfcac/MicrosoftEdgeEnterpriseX64.msi'
  silentArgs     = '/quiet /norestart'
  validExitCodes = @(0)
  softwareName   = 'edge*'
  checksum       = '55245A17B792568B7C6778314826F018203162A7ABA87CFAECEAC19F79057C44'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
