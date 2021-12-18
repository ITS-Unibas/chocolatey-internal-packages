$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'msedge'
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType       = 'msi'
  url            = 'https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/e0f579f4-420a-43fb-b0b1-e6f86712ac76/MicrosoftEdgeEnterpriseX64.msi'
  silentArgs     = '/quiet /norestart'
  validExitCodes = @(0)
  softwareName   = 'edge*'
  checksum       = '68FDBCACE08D3CC07523E5ABE0F23035AC41B22D2542CFE5EC91C837F88E0035'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
