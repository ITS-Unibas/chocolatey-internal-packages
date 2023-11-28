$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'msedge'
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType       = 'msi'
  url            = 'https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/a586c80f-e695-4339-8045-763d7e9e5e1a/MicrosoftEdgeEnterpriseX64.msi'
  silentArgs     = '/quiet /norestart'
  validExitCodes = @(0)
  softwareName   = 'edge*'
  checksum       = '17BF99A0E408984CE005B0665D7BEF47F236CD4A25D52C4B1321C15DC9666307'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
