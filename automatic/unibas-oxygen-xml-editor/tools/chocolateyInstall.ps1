$ErrorActionPreference = 'Stop';

$packageName = 'unibas-oxygen-xml-editor'

$packageArgs = @{
  packageName    = $packageName
  fileType       = 'EXE'
  url            = 'https://mirror.oxygenxml.com/InstData/Editor/Windows64/VM/oxygen-64bit-openjdk.exe'
  silentArgs     = "/silent /install"
  validExitCodes = @(0)
  softwareName   = 'unibas-oxygen-xml-editor*'
  checksum       = '05a62e13931b12fb246e4d751be1adc3575649cd349ab7ceab78e5a718b6ce49'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
