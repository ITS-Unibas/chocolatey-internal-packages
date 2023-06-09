$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'msedge'
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType       = 'msi'
  url            = 'https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/fbc0bcd9-401c-421f-b670-818193b2a321/MicrosoftEdgeEnterpriseX64.msi'
  silentArgs     = '/quiet /norestart'
  validExitCodes = @(0)
  softwareName   = 'edge*'
  checksum       = 'F82139CCBF86869A0DB26D4B6547137ED32E735E89021A57869832AE63689395'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
