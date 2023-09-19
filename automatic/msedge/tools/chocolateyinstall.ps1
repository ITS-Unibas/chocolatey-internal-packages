$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'msedge'
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType       = 'msi'
  url            = 'https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/67dc0ab1-5cdd-4c98-839f-85ce094d0ea6/MicrosoftEdgeEnterpriseX64.msi'
  silentArgs     = '/quiet /norestart'
  validExitCodes = @(0)
  softwareName   = 'edge*'
  checksum       = '087BDEB8564861FECE08C35D3519C71F896432782576E10D968F76E3CBE30EEE'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
