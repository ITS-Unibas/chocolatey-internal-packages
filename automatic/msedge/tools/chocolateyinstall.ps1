$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'msedge'
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType       = 'msi'
  url            = 'https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/0b66d982-40c9-4487-95d4-cf22447bc879/MicrosoftEdgeEnterpriseX64.msi'
  silentArgs     = '/quiet /norestart'
  validExitCodes = @(0)
  softwareName   = 'edge*'
  checksum       = '49B66768BE08607D8C362744B8069906E142AC68D9FCC49F461BE40B0447028C'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
