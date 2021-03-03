$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'vcredist140-x64'
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType       = 'exe'
  url            = 'https://download.visualstudio.microsoft.com/download/pr/cd3a705f-70b6-46f7-b8e2-63e6acc5bd05/F299953673DE262FEFAD9DD19BFBE6A5725A03AE733BEBFEC856F1306F79C9F7/VC_redist.x64.exe'
  silentArgs     = '/quiet /norestart'
  validExitCodes = @(0, 1638, 3010)
  softwareName   = 'Microsoft Visual C++ 2015-2019 Redistributable (x64)*'
  checksum       = 'f299953673de262fefad9dd19bfbe6a5725a03ae733bebfec856f1306f79c9f7'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
