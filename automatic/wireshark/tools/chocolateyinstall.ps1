$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  softwareName   = 'Wireshark*'
  fileType       = 'exe'
  url            = 'https://2.na.dl.wireshark.org/win64/Wireshark-4.6.6-x64.exe'
  checksum       = 'ab28d13695ace992307fb1aaea7144f977d5b6562acec1f465c9c0a9fa04190c'
  checksumType   = 'sha256'
  silentArgs     = '/S /quicklaunchicon=no'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
