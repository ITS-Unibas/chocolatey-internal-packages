$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'msedge'
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType       = 'msi'
  url            = 'https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/4f2f46e1-178a-495d-adc8-c3492147e357/MicrosoftEdgeEnterpriseX64.msi'
  silentArgs     = '/quiet /norestart'
  validExitCodes = @(0)
  softwareName   = 'edge*'
  checksum       = '6B40BA9E503C750322EAE05317CCCACD97021DF6A009617D9980D6BDBC08E861'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
