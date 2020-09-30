$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'vcredist140-x86'
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType       = 'exe'
  url            = 'https://download.visualstudio.microsoft.com/download/pr/48431a06-59c5-4b63-a102-20b66a521863/CAA38FD474164A38AB47AC1755C8CCCA5CCFACFA9A874F62609E6439924E87EC/VC_redist.x86.exe'
  silentArgs     = '/quiet /norestart'
  validExitCodes = @(0, 1638, 3010)
  softwareName   = 'Microsoft Visual C++ 2015-2019 Redistributable (x86)*'
  checksum       = 'caa38fd474164a38ab47ac1755c8ccca5ccfacfa9a874f62609e6439924e87ec'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
