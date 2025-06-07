$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'msedge'
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType       = 'msi'
  url            = 'https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/cb21e6b5-3f63-4df2-bec3-a2015b80dc56/MicrosoftEdgeEnterpriseX64.msi'
  silentArgs     = '/quiet /norestart'
  validExitCodes = @(0)
  softwareName   = 'edge*'
  checksum       = 'BB8DE4A7A918E0C0DCF25CAA5CB2B18A064DF9BA55EB7ADBF17FAC3E959A1D49'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
