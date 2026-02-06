$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'msedge'
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType       = 'msi'
  url            = 'https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/f2a31dc0-dabd-4e4e-9618-0b31a3fc5d53/MicrosoftEdgeEnterpriseX64.msi'
  silentArgs     = '/quiet /norestart'
  validExitCodes = @(0)
  softwareName   = 'edge*'
  checksum       = 'C53B607D35DB106531C84916513754A771BC70CD0680B7414AB31B1357334710'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
