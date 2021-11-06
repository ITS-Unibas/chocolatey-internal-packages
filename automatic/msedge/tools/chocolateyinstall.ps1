$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'msedge'
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType       = 'msi'
  url            = 'https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/93862b4a-15ae-40a0-b501-f969633661e2/MicrosoftEdgeEnterpriseX64.msi'
  silentArgs     = '/quiet /norestart'
  validExitCodes = @(0)
  softwareName   = 'edge*'
  checksum       = '7F0E61839F618D9E09C487E9E66755EE2094A31FD4BF83973C6B044E238ED745'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
