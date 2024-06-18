$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'msedge'
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType       = 'msi'
  url            = 'https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/a71e77fb-bd87-4015-9063-d9cd752fd708/MicrosoftEdgeEnterpriseX64.msi'
  silentArgs     = '/quiet /norestart'
  validExitCodes = @(0)
  softwareName   = 'edge*'
  checksum       = '6AA033BFE68BB9428F963A35BA5FE85035F480F2FE647C8A660961EA6D849D29'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
