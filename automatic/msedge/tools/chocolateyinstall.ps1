$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'msedge'
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType       = 'msi'
  url            = 'https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/fe137e50-cbf8-4641-9108-a7d3b019dbc5/MicrosoftEdgeEnterpriseX64.msi'
  silentArgs     = '/quiet /norestart'
  validExitCodes = @(0)
  softwareName   = 'edge*'
  checksum       = '4E935CB48F5DFDAE7568FBC17504FCE19B8265F8F06D719F40EFB026DE29F318'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
