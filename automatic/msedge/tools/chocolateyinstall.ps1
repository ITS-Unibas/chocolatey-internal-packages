$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'msedge'
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType       = 'msi'
  url            = 'https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/34a838fd-72a5-4e14-ac91-3a706b79d608/MicrosoftEdgeEnterpriseX64.msi'
  silentArgs     = '/quiet /norestart'
  validExitCodes = @(0)
  softwareName   = 'edge*'
  checksum       = 'F6FE1F2B7B96FA90CCF47A042FC49D87FE8C4EF500FD526F4F253EF86CDBD715'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
