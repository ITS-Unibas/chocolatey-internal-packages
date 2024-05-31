$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'msedge'
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType       = 'msi'
  url            = 'https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/b22409ee-f072-40f3-a14c-bed638a55bc2/MicrosoftEdgeEnterpriseX64.msi'
  silentArgs     = '/quiet /norestart'
  validExitCodes = @(0)
  softwareName   = 'edge*'
  checksum       = 'DD1886A4D303CA5A48FB7D5D91E1B8322AF0598C52C6621DF6016A2A004FE5DA'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
