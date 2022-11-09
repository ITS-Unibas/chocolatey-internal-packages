$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'vcredist140-x64'
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType       = 'exe'
  url            = 'https://download.visualstudio.microsoft.com/download/pr/bcb0cef1-f8cb-4311-8a5c-650a5b694eab/2257B3FBE3C7559DE8B31170155A433FAF5B83829E67C589D5674FF086B868B9/VC_redist.x64.exe'
  silentArgs     = '/quiet /norestart'
  validExitCodes = @(0, 1638, 3010)
  softwareName   = 'Microsoft Visual C++ 2015-2019 Redistributable (x64)*'
  checksum       = '2257b3fbe3c7559de8b31170155a433faf5b83829e67c589d5674ff086b868b9'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
