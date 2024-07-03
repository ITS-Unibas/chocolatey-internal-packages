$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'msedge'
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType       = 'msi'
  url            = 'https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/213fe4e0-da5e-41b2-a969-e1ecafa88256/MicrosoftEdgeEnterpriseX64.msi'
  silentArgs     = '/quiet /norestart'
  validExitCodes = @(0)
  softwareName   = 'edge*'
  checksum       = '37F02A5321970FC63E415E5D7734962AD1FEFE59A87E43B7B272929B00284D66'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
