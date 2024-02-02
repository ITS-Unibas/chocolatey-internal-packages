$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'msedge'
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType       = 'msi'
  url            = 'https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/c899d157-b2bc-4511-9553-d59052b20fbf/MicrosoftEdgeEnterpriseX64.msi'
  silentArgs     = '/quiet /norestart'
  validExitCodes = @(0)
  softwareName   = 'edge*'
  checksum       = 'DE93A803F5DC865EC5EF72112D537DB9609762650D3A858250DC7A9C8548B791'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
