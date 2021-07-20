$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'msedge'
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType       = 'msi'
  url            = 'https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/f2f4b410-a9b9-4b1a-bca1-2b2af7805bba/MicrosoftEdgeEnterpriseX64.msi'
  silentArgs     = '/quiet /norestart'
  validExitCodes = @(0)
  softwareName   = 'edge*'
  checksum       = '4685EF0B2C02D5C612CE58C3E2979C9636BF71979E117D49C2DDB61CF3964DD5'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
