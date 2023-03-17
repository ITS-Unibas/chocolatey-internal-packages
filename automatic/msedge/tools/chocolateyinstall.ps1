$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'msedge'
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType       = 'msi'
  url            = 'https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/0ac7e1bd-ebbe-4895-8694-1952a345a987/MicrosoftEdgeEnterpriseX64.msi'
  silentArgs     = '/quiet /norestart'
  validExitCodes = @(0)
  softwareName   = 'edge*'
  checksum       = 'B8C25D97D51C057A027113969CAFC6F52833B38AB26C4B742CB657C6F7AFF058'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
