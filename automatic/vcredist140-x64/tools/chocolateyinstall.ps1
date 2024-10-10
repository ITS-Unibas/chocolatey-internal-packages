$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'vcredist140-x64'
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType       = 'exe'
  url            = 'https://download.visualstudio.microsoft.com/download/pr/368cc6bf-087b-49f9-93e6-ab05b70a58e0/814E9DA5EC5E5D6A8FA701999D1FC3BADDF7F3ADC528E202590E9B1CB73E4A11/VC_redist.x64.exe'
  silentArgs     = '/quiet /norestart'
  validExitCodes = @(0, 1638, 3010)
  softwareName   = 'Microsoft Visual C++ 2015-2019 Redistributable (x64)*'
  checksum       = '814e9da5ec5e5d6a8fa701999d1fc3baddf7f3adc528e202590e9b1cb73e4a11'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
