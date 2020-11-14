$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'msedge'
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType       = 'msi'
  url            = 'https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/ab0c8679-a83c-450b-bdf1-2a955cf23ad4/MicrosoftEdgeEnterpriseX64.msi'
  silentArgs     = '/quiet /norestart'
  validExitCodes = @(0)
  softwareName   = 'edge*'
  checksum       = 'C81515EC9E835CD031E93EE9FCF6067479E91363862899215488839CE4A2EE71'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
