$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'msedge'
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType       = 'msi'
  url            = 'http://dl.delivery.mp.microsoft.com/filestreamingservice/files/149836ca-8678-4316-a06f-7ac60c4d1693/MicrosoftEdgeEnterpriseX64.msi'
  silentArgs     = '/quiet /norestart'
  validExitCodes = @(0)
  softwareName   = 'edge*'
  checksum       = 'F5CFB369534A04B1CAACC608E2713164D75DD0BC06E8BFB152AC3D8A1318181E'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
