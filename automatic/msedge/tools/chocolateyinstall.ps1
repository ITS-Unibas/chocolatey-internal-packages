$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'msedge'
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType       = 'msi'
  url            = 'https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/50940088-a2ff-4d2c-acd0-80ae0ffe92fb/MicrosoftEdgeEnterpriseX64.msi'
  silentArgs     = '/quiet /norestart'
  validExitCodes = @(0)
  softwareName   = 'edge*'
  checksum       = '0C10104806416795CBEB9336562153DD96C1DEA248C513F40D300384673B90EE'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
