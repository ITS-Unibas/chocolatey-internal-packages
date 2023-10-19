$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'msedge'
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType       = 'msi'
  url            = 'https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/6cac58ee-1278-44bc-b2cb-3fc3c116f6bd/MicrosoftEdgeEnterpriseX64.msi'
  silentArgs     = '/quiet /norestart'
  validExitCodes = @(0)
  softwareName   = 'edge*'
  checksum       = '00A53A5132D413B58F626A4320FBEE1F556DC2CB2B2195597BA561906E105449'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
