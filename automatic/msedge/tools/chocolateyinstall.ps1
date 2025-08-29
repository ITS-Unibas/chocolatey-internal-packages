$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'msedge'
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType       = 'msi'
  url            = 'https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/0d5de05b-f777-4003-89ba-2bdf61178e88/MicrosoftEdgeEnterpriseX64.msi'
  silentArgs     = '/quiet /norestart'
  validExitCodes = @(0)
  softwareName   = 'edge*'
  checksum       = '03102879D9CD5881661B4A4F22D0C6F06FDBB5636F06FCF86C28DC3628529F51'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
