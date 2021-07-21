$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'vcredist140-x64'
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType       = 'exe'
  url            = 'https://download.visualstudio.microsoft.com/download/pr/36e45907-8554-4390-ba70-9f6306924167/97CC5066EB3C7246CF89B735AE0F5A5304A7EE33DC087D65D9DFF3A1A73FE803/VC_redist.x64.exe'
  silentArgs     = '/quiet /norestart'
  validExitCodes = @(0, 1638, 3010)
  softwareName   = 'Microsoft Visual C++ 2015-2019 Redistributable (x64)*'
  checksum       = '97cc5066eb3c7246cf89b735ae0f5a5304a7ee33dc087d65d9dff3a1a73fe803'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
