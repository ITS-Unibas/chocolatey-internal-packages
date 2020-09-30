$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'vcredist140-x64'
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType       = 'exe'
  url            = 'https://download.visualstudio.microsoft.com/download/pr/48431a06-59c5-4b63-a102-20b66a521863/4B5890EB1AEFDF8DFA3234B5032147EB90F050C5758A80901B201AE969780107/VC_redist.x64.exe'
  silentArgs     = '/quiet /norestart'
  validExitCodes = @(0, 1638, 3010)
  softwareName   = 'Microsoft Visual C++ 2015-2019 Redistributable (x64)*'
  checksum       = '4b5890eb1aefdf8dfa3234b5032147eb90f050c5758a80901b201ae969780107'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
