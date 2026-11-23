$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'vcredist140-x86'
  fileType       = 'exe'
  url            = 'https://aka.ms/vc14/vc_redist.x86.exe'
  silentArgs     = '/quiet /norestart'
  validExitCodes = @(0, 1638, 3010)
  softwareName   = 'Microsoft Visual C++ v14 Redistributable (x86)*'
  checksum       = '7b0117e6e20e9e349029c000a8a2715a52cf37c15b6bb697b2908e8bc7066cdf'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
