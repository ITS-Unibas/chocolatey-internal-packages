$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'vcredist13-x86'
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType       = 'exe'
  url            = 'http://download.microsoft.com/download/C/C/2/CC2DF5F8-4454-44B4-802D-5EA68D086676/vcredist_x86.exe'
  silentArgs     = '/quiet /norestart'
  validExitCodes = @(0, 1638, 3010)
  softwareName   = 'Microsoft Visual C++ 2013 Redistributable (x86)*'
  checksum       = '3fd0a926dbcc5306e1b3e529637ab3e698070c6e93b5de7f6ba05d691349ef78'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
