$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'msedge'
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType       = 'msi'
  url            = 'https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/1f9494cc-b62f-45f2-8a58-73520450909c/MicrosoftEdgeEnterpriseX64.msi'
  silentArgs     = '/quiet /norestart'
  validExitCodes = @(0)
  softwareName   = 'edge*'
  checksum       = '715C485084B664E64860C4162E0F8E341AC0863E00E92CC5D64C78ACEF236B32'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
