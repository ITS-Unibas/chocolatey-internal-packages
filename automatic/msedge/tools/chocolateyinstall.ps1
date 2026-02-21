$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'msedge'
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType       = 'msi'
  url            = 'https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/43078097-9047-41f0-8e73-bdfea994eb7d/MicrosoftEdgeEnterpriseX64.msi'
  silentArgs     = '/quiet /norestart'
  validExitCodes = @(0)
  softwareName   = 'edge*'
  checksum       = 'F91CEF0E429BBF7F4B244D979054C415E5842B179EDD2719F2DE93D113A0803A'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
