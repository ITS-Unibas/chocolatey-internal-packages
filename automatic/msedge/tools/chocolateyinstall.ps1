$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'msedge'
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType       = 'msi'
  url            = 'https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/c51f8c3f-6bcd-412b-abc9-44abcd9b7622/MicrosoftEdgeEnterpriseX64.msi'
  silentArgs     = '/quiet /norestart'
  validExitCodes = @(0)
  softwareName   = 'edge*'
  checksum       = 'A397BF93BD77BB9E9717619FF3012773E813E80522B1A7E42880758E0671B195'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
