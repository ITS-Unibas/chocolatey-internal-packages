$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'msedge'
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType       = 'msi'
  url            = 'https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/1e31b6ea-8368-4a80-b494-2ffa12a70507/MicrosoftEdgeEnterpriseX64.msi'
  silentArgs     = '/quiet /norestart'
  validExitCodes = @(0)
  softwareName   = 'edge*'
  checksum       = '022D78C7B2DFBE62DC97A1E5B6F7E373B2C90D91A484A98548928575C0AA2AC4'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
