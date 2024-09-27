$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  softwareName   = 'Wireshark*'
  fileType       = 'exe'
  url            = ''
  checksum       = ''
  checksumType   = 'sha256'
  silentArgs     = '/S /quicklaunchicon=no'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
