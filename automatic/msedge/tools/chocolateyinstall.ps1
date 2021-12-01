$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'msedge'
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType       = 'msi'
  url            = 'https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/128ec587-046b-4501-81b5-20291af3d749/MicrosoftEdgeEnterpriseX64.msi'
  silentArgs     = '/quiet /norestart'
  validExitCodes = @(0)
  softwareName   = 'edge*'
  checksum       = '0B2D87DE64B186555464409EF03E493BF39758E6564DFA4ED73266692DCED2DB'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
