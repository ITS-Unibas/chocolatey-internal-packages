$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'msedge'
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType       = 'msi'
  url            = 'https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/d93e7693-994c-4680-b880-673afcf10b25/MicrosoftEdgeEnterpriseX64.msi'
  silentArgs     = '/quiet /norestart'
  validExitCodes = @(0)
  softwareName   = 'edge*'
  checksum       = '2A79C15DC3FC6788390F41C6B4F9A220DDADE3A6B5D8A9D9CD5FFEF1F0F5BA30'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
