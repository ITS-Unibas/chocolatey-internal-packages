$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'vcredist140-x86'
  fileType       = 'exe'
  url            = 'https://download.visualstudio.microsoft.com/download/pr/57eef8ae-a341-46c3-b0bc-c041027b54cd/F0BAB33A302B3CDB2E11113760D016F54FD3D2632C65BA7834FAC4F0ABD7F1A3/VC_redist.x86.exe'
  silentArgs     = '/quiet /norestart'
  validExitCodes = @(0, 1638, 3010)
  softwareName   = 'Microsoft Visual C++ v14 Redistributable (x86)*'
  checksum       = 'f0bab33a302b3cdb2e11113760d016f54fd3d2632c65ba7834fac4f0abd7f1a3'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
