$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'vcredist12-x86'
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType       = 'exe'
  url            = 'https://download.microsoft.com/download/1/6/B/16B06F60-3B20-4FF2-B699-5E9B7962F9AE/VSU_4/vcredist_x86.exe'
  silentArgs     = '/quiet /norestart'
  validExitCodes = @(0, 1638, 3010)
  softwareName   = 'Microsoft Visual C++ 2012 Redistributable (x86)*'
  checksum       = 'b924ad8062eaf4e70437c8be50fa612162795ff0839479546ce907ffa8d6e386'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
