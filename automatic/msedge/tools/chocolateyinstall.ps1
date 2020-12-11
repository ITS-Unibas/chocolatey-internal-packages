$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'msedge'
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType       = 'msi'
  url            = 'https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/b4b09058-b46b-4286-8124-83b31bcc1b7b/MicrosoftEdgeEnterpriseX64.msi'
  silentArgs     = '/quiet /norestart'
  validExitCodes = @(0)
  softwareName   = 'edge*'
  checksum       = 'AD606D7C21775F04A5DABB970D3C765DD1B2C089CA811F7E238A74D798BEF8F0'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
