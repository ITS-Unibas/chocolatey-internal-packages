$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'vcredist140-x64'
  fileType       = 'exe'
  url            = 'https://aka.ms/vc14/vc_redist.x64.exe'
  silentArgs     = '/quiet /norestart'
  validExitCodes = @(0, 1638, 3010)
  softwareName   = 'Microsoft Visual C++ v14 Redistributable (x64)*'
  checksum       = '843068991daaa1f73ad9f6239bce4d0f6a07a51f18c37ea2a867e9beca71295c'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
