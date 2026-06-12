$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'msedge'
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType       = 'msi'
  url            = 'https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/1620c248-1a72-4421-966f-1404bb5ccc34/MicrosoftEdgeEnterpriseX64.msi'
  silentArgs     = '/quiet /norestart'
  validExitCodes = @(0)
  softwareName   = 'edge*'
  checksum       = '11C34DBD3891744A459746E270DD02897A2C6260F14390BC4389312EBD243785'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
