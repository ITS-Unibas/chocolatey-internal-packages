$ErrorActionPreference = 'Stop';

$packageName = 'unibas-oxygen-xml-editor'

$packageArgs = @{
  packageName    = $packageName
  fileType       = 'EXE'
  url            = 'https://mirror.oxygenxml.com/InstData/Editor/Windows64/VM/oxygen-64bit-openjdk.exe'
  silentArgs     = "/silent /install"
  validExitCodes = @(0)
  softwareName   = 'unibas-oxygen-xml-editor*'
  checksum       = '8ec0b2d693137dcf612933c3116fac935bf79cd29b02bb61d47678b97c5093a2'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
