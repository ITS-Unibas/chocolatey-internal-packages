$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'msedge'
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType       = 'msi'
  url            = 'https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/e0f78bdd-6c7a-4a87-a631-f5557bed178b/MicrosoftEdgeEnterpriseX64.msi'
  silentArgs     = '/quiet /norestart'
  validExitCodes = @(0)
  softwareName   = 'edge*'
  checksum       = '0EFBE69DC0BD4DB67D9DC485B784A7B83C5536D01014BC9A1F89FD14DAC11844'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
