$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'msedge'
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType       = 'msi'
  url            = 'https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/44b00339-4b5d-434b-8267-8f5bcfad0286/MicrosoftEdgeEnterpriseX64.msi'
  silentArgs     = '/quiet /norestart'
  validExitCodes = @(0)
  softwareName   = 'edge*'
  checksum       = 'DFA93B4E36FCADFD5FA219A9CED80444D236E4690AFE5BAB52DBC44BED6BAD93'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
