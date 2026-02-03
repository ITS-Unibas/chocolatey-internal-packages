$ErrorActionPreference = 'Stop';

$packageName = 'unibas-oxygen-xml-editor'

$packageArgs = @{
  packageName    = $packageName
  fileType       = 'EXE'
  url            = 'https://mirror.oxygenxml.com/InstData/Editor/Windows64/VM/oxygen-64bit-openjdk.exe'
  silentArgs     = "/silent /install"
  validExitCodes = @(0)
  softwareName   = 'unibas-oxygen-xml-editor*'
  checksum       = 'cee5c88a07438984889bfdb6b71abafdbb61a69c4ee13de5a3745d5cb8f44cea'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
