$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'vcredist10-x64'
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType       = 'exe'
  url            = 'https://download.microsoft.com/download/A/8/0/A80747C3-41BD-45DF-B505-E9710D2744E0/vcredist_x64.exe'
  silentArgs     = '/quiet /norestart'
  validExitCodes = @(0, 1638, 3010)
  softwareName   = 'Microsoft Visual C++ 2010 Redistributable (x64)*'
  checksum       = 'c6cd2d3f0b11dc2a604ffdc4dd97861a83b77e21709ba71b962a47759c93f4c8'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
