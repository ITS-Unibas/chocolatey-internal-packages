$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'msedge'
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType       = 'msi'
  url            = 'https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/4fdb94a2-5317-4428-bc1b-f26677acf79f/MicrosoftEdgeEnterpriseX64.msi'
  silentArgs     = '/quiet /norestart'
  validExitCodes = @(0)
  softwareName   = 'edge*'
  checksum       = '78F3FE9624B0A549C63DFD8AD497EF12A3BE209CBCA78C850454DB33022337BD'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
