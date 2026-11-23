$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'vcredist140-x64'
  fileType       = 'exe'
  url            = 'https://aka.ms/vc14/vc_redist.x64.exe'
  silentArgs     = '/quiet /norestart'
  validExitCodes = @(0, 1638, 3010)
  softwareName   = 'Microsoft Visual C++ v14 Redistributable (x64)*'
  checksum       = '9c02c9ed120f671b900e6b9471d890e3b2414117a7e53f4ae2e855466fa2b7c9'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
