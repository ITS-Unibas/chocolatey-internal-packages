$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'vcredist140-x64'
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType       = 'exe'
  url            = 'https://download.visualstudio.microsoft.com/download/pr/6ba404bb-6312-403e-83be-04b062914c98/1AD7988C17663CC742B01BEF1A6DF2ED1741173009579AD50A94434E54F56073/VC_redist.x64.exe'
  silentArgs     = '/quiet /norestart'
  validExitCodes = @(0, 1638, 3010)
  softwareName   = 'Microsoft Visual C++ 2015-2019 Redistributable (x64)*'
  checksum       = '1ad7988c17663cc742b01bef1a6df2ed1741173009579ad50a94434e54f56073'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
