$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'msedge'
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType       = 'msi'
  url            = 'https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/bb161c65-c060-4e98-a125-5e412c0b3364/MicrosoftEdgeEnterpriseX64.msi'
  silentArgs     = '/quiet /norestart'
  validExitCodes = @(0)
  softwareName   = 'edge*'
  checksum       = 'DC00269CCB23E9C0747DF74461804ED4AC6E590F74040E3C4F92949F36AD8631'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
