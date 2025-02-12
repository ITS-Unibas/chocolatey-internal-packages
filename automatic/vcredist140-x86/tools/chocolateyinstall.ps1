$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'vcredist140-x86'
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType       = 'exe'
  url            = 'https://download.visualstudio.microsoft.com/download/pr/285b28c7-3cf9-47fb-9be8-01cf5323a8df/C4E3992F3883005881CF3937F9E33F1C7D792AC1C860EA9C52D8F120A16A7EB1/VC_redist.x86.exe'
  silentArgs     = '/quiet /norestart'
  validExitCodes = @(0, 1638, 3010)
  softwareName   = 'Microsoft Visual C++ 2015-2019 Redistributable (x86)*'
  checksum       = 'c4e3992f3883005881cf3937f9e33f1c7d792ac1c860ea9c52d8f120a16a7eb1'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
