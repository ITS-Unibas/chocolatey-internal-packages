$ErrorActionPreference = 'Stop';

$packageName = 'unibas-oxygen-xml-editor'

$packageArgs = @{
  packageName    = $packageName
  fileType       = 'EXE'
  url            = 'https://mirror.oxygenxml.com/InstData/Editor/Windows64/VM/oxygen-64bit-openjdk.exe'
  silentArgs     = "/silent /install"
  validExitCodes = @(0)
  softwareName   = 'unibas-oxygen-xml-editor*'
  checksum       = '372eea8456136b8451c11ec9fecb78c1eb503e3963dc7af595ccb827ea1775c6'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
