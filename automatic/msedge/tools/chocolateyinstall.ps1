$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'msedge'
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType       = 'msi'
  url            = 'https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/e5357ebe-ed73-41e3-ac99-e7c8a755c4cf/MicrosoftEdgeEnterpriseX64.msi'
  silentArgs     = '/quiet /norestart'
  validExitCodes = @(0)
  softwareName   = 'edge*'
  checksum       = '2582022A6FCC9CF607AE32A1D817D80CF0C63E15E618D575F466CB45340EE3D2'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
