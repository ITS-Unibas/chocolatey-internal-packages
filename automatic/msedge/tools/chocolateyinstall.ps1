$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'msedge'
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType       = 'msi'
  url            = 'https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/6476e2cb-803c-4ed9-b91f-60caaa21dbfd/MicrosoftEdgeEnterpriseX64.msi'
  silentArgs     = '/quiet /norestart'
  validExitCodes = @(0)
  softwareName   = 'edge*'
  checksum       = '94A406CDC1AB9C1C8AC8AA48B42D89E4E35CEE68622CDA718B301E5E3ED93B49'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
