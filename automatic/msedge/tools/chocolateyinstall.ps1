$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'msedge'
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType       = 'msi'
  url            = 'https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/6f215223-1df2-408a-a3f7-68adb66961ef/MicrosoftEdgeEnterpriseX64.msi'
  silentArgs     = '/quiet /norestart'
  validExitCodes = @(0)
  softwareName   = 'edge*'
  checksum       = 'B39E3F3BDA94EDD7B467ECC9ECD12F39D899A385DAD091350C1E3F406DE68EAC'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
