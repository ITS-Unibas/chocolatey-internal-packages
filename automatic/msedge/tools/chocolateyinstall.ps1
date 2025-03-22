$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'msedge'
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType       = 'msi'
  url            = 'https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/f9137856-3c6a-4a53-8a62-6c3b539149b0/MicrosoftEdgeEnterpriseX64.msi'
  silentArgs     = '/quiet /norestart'
  validExitCodes = @(0)
  softwareName   = 'edge*'
  checksum       = '2335B28CF728D69705F74A980251E329D5EE4F2BDDFA4595E5CEABBD063ACDC2'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
