$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'vcredist140-x86'
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType       = 'exe'
  url            = 'https://download.visualstudio.microsoft.com/download/pr/9c69db26-cda4-472d-bdae-f2b87f4a0177/A32DD41EAAB0C5E1EAA78BE3C0BB73B48593DE8D97A7510B97DE3FD993538600/VC_redist.x86.exe'
  silentArgs     = '/quiet /norestart'
  validExitCodes = @(0, 1638, 3010)
  softwareName   = 'Microsoft Visual C++ 2015-2019 Redistributable (x86)*'
  checksum       = 'a32dd41eaab0c5e1eaa78be3c0bb73b48593de8d97a7510b97de3fd993538600'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
