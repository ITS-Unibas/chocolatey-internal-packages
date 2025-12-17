$ErrorActionPreference = 'Stop';

$packageName = 'unibas-oxygen-xml-editor'

$packageArgs = @{
  packageName    = $packageName
  fileType       = 'EXE'
  url            = 'https://mirror.oxygenxml.com/InstData/Editor/Windows64/VM/oxygen-64bit-openjdk.exe'
  silentArgs     = "/silent /install"
  validExitCodes = @(0)
  softwareName   = 'unibas-oxygen-xml-editor*'
  checksum       = 'eaa517f75d2ca98c9fce2ee94bc61eeb180b4db93c21b8508447c6d8f3716451'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
