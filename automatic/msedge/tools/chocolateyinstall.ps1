$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'msedge'
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType       = 'msi'
  url            = 'https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/52956063-8ecb-4407-9ac1-52db779bb126/MicrosoftEdgeEnterpriseX64.msi'
  silentArgs     = '/quiet /norestart'
  validExitCodes = @(0)
  softwareName   = 'edge*'
  checksum       = '9AB4B17469440056F2E59D7AA04622C6584DC8B47C087300DC97D979AC7D9F99'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
