$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'msedge'
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType       = 'msi'
  url            = 'https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/8f3eb045-0036-4f0c-a153-1c8e0f6b73b4/MicrosoftEdgeEnterpriseX64.msi'
  silentArgs     = '/quiet /norestart'
  validExitCodes = @(0)
  softwareName   = 'edge*'
  checksum       = '91EBD0B7EDDF9C70F53E6F0EB499EB689CB4BB45F96A21F031181F79833BBC64'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
