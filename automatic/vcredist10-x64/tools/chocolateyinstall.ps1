$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'vcredist10-x64'
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType       = 'exe'
  url            = 'https://download.microsoft.com/download/A/8/0/A80747C3-41BD-45DF-B505-E9710D2744E0/vcredist_x64.exe'
  silentArgs     = '/quiet /norestart'
  validExitCodes = @(0, 1638, 3010)
  softwareName   = 'Microsoft Visual C++ 2010 Redistributable (x64)*'
  checksum       = 'b924ad8062eaf4e70437c8be50fa612162795ff0839479546ce907ffa8d6e386'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
