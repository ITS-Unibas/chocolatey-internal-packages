$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'msedge'
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType       = 'msi'
  url            = 'https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/b5176aa0-0e05-4055-97bd-018350686657/MicrosoftEdgeEnterpriseX64.msi'
  silentArgs     = '/quiet /norestart'
  validExitCodes = @(0)
  softwareName   = 'edge*'
  checksum       = '68F2A1B93B368A5CDAF5687094DD605DD33DE01B93B0A00B6A7FE259149D0951'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
