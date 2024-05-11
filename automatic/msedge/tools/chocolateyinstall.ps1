$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'msedge'
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType       = 'msi'
  url            = 'https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/a8ae5479-c0a0-40c2-b9fa-9b75a9b08b38/MicrosoftEdgeEnterpriseX64.msi'
  silentArgs     = '/quiet /norestart'
  validExitCodes = @(0)
  softwareName   = 'edge*'
  checksum       = 'B9712090AD7E86FE500A706AEC6C49114616B1ECC905C4224313D6D1C4D11A6C'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
