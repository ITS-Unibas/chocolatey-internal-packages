$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'msedge'
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType       = 'msi'
  url            = 'https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/9cf28cab-0858-4edc-b581-a050376b96e2/MicrosoftEdgeEnterpriseX64.msi'
  silentArgs     = '/quiet /norestart'
  validExitCodes = @(0)
  softwareName   = 'edge*'
  checksum       = '3C3E817FC0FE6406DB334808993CFF43880FB36099DF15A759ADD10A9EDCF37F'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
