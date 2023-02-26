$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'msedge'
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType       = 'msi'
  url            = 'https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/e58c854a-b3e4-4cd4-a9dc-e74e64149573/MicrosoftEdgeEnterpriseX64.msi'
  silentArgs     = '/quiet /norestart'
  validExitCodes = @(0)
  softwareName   = 'edge*'
  checksum       = '888242D5CDD2FDA62488014F96FDE403634760D21E5F9DFA770C1ECB34D52365'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
