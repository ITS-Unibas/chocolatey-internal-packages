$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'msedge'
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType       = 'msi'
  url            = 'https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/2521c007-c376-4e08-8570-6d8526416a27/MicrosoftEdgeEnterpriseX64.msi'
  silentArgs     = '/quiet /norestart'
  validExitCodes = @(0)
  softwareName   = 'edge*'
  checksum       = '0884104EBCC29D045D5269E4346E8D81321A9C17083A83A989C7714E3C4F5C9D'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
