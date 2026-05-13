$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'vcredist140-x64'
  fileType       = 'exe'
  url            = 'https://download.visualstudio.microsoft.com/download/pr/c1bd4f2c-3672-468e-8480-7ed419dbb641/90E48ADE404E4576D023ABFA374F323555F233982A8805EA9AC63DCA9491A16B/VC_redist.x64.exe'
  silentArgs     = '/quiet /norestart'
  validExitCodes = @(0, 1638, 3010)
  softwareName   = 'Microsoft Visual C++ v14 Redistributable (x64)*'
  checksum       = '90e48ade404e4576d023abfa374f323555f233982a8805ea9ac63dca9491a16b'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
