$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'msedge'
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType       = 'msi'
  url            = 'https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/b7be1f33-424d-4f47-83bc-f1b4f42ef0c0/MicrosoftEdgeEnterpriseX64.msi'
  silentArgs     = '/quiet /norestart'
  validExitCodes = @(0)
  softwareName   = 'edge*'
  checksum       = 'F42BF3C00B47994AA4B19C44F110F523E28234487E182AF7FE7538A5C9BD0B54'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
