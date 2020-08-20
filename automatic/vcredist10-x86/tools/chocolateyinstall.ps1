$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'vcredist10-x86'
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType       = 'exe'
  url            = 'https://download.microsoft.com/download/C/6/D/C6D0FD4E-9E53-4897-9B91-836EBA2AACD3/vcredist_x86.exe'
  silentArgs     = '/quiet /norestart'
  validExitCodes = @(0, 1638, 3010)
  softwareName   = 'Microsoft Visual C++ 2010 Redistributable (x86)*'
  checksum       = '66b797b3b4f99488f53c2b676610dfe9868984c779536891a8d8f73ee214bc4b'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
