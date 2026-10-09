$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'msedge'
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType       = 'msi'
  url            = 'https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/2e772119-b856-4562-ad9a-8422e4224d42/MicrosoftEdgeEnterpriseX64.msi'
  silentArgs     = '/quiet /norestart'
  validExitCodes = @(0)
  softwareName   = 'edge*'
  checksum       = '46DB09D14B85A0DF8BCA87FBE9C3224CCF54F97D776BEDC2EEBF4B0C2CCBF5B4'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
