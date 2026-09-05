$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'msedge'
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType       = 'msi'
  url            = 'https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/2757513f-2ec6-4bb1-b23a-5738a92d7a56/MicrosoftEdgeEnterpriseX64.msi'
  silentArgs     = '/quiet /norestart'
  validExitCodes = @(0)
  softwareName   = 'edge*'
  checksum       = '5BCF8CD57351DDAA94419F800F8D90B8CBAF2B485B49D9DDB07D055B76A518DF'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
