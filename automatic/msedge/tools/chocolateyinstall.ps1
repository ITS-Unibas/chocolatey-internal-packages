$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'msedge'
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType       = 'msi'
  url            = 'http://dl.delivery.mp.microsoft.com/filestreamingservice/files/cf7325bf-09ab-4659-a24c-3e2bd975ccfe/MicrosoftEdgeEnterpriseX64.msi'
  silentArgs     = '/quiet /norestart'
  validExitCodes = @(0)
  softwareName   = 'edge*'
  checksum       = 'C4EACB85A29452C27309CB6E4D495C1661B768135451464AB52CC157BA84706E'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
