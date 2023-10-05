$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'msedge'
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType       = 'msi'
  url            = 'https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/7451f59e-7e1b-43e8-9c45-447ff3b1fdec/MicrosoftEdgeEnterpriseX64.msi'
  silentArgs     = '/quiet /norestart'
  validExitCodes = @(0)
  softwareName   = 'edge*'
  checksum       = 'D9EE94E39F4B037C1523A5EA246636E512D1F7018C671B0037A364E0CBFB32CC'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
