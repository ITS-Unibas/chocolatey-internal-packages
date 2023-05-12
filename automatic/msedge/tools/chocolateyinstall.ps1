$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'msedge'
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType       = 'msi'
  url            = 'https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/a63c2232-f413-4abf-abf2-fc354bb7f17f/MicrosoftEdgeEnterpriseX64.msi'
  silentArgs     = '/quiet /norestart'
  validExitCodes = @(0)
  softwareName   = 'edge*'
  checksum       = '5AD68F4873A264BB802D2893B50669440C045655DED1CFF50FC78069D3C285CC'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
