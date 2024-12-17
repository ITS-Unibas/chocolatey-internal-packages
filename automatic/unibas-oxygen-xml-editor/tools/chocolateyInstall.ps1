$ErrorActionPreference = 'Stop';

$packageName = 'unibas-oxygen-xml-editor'

$packageArgs = @{
  packageName    = $packageName
  fileType       = 'EXE'
  url            = 'https://mirror.oxygenxml.com/InstData/Editor/Windows64/VM/oxygen-64bit-openjdk.exe'
  silentArgs     = "/silent /install"
  validExitCodes = @(0)
  softwareName   = 'unibas-oxygen-xml-editor*'
  checksum       = 'e431a03e7bc1868e1c0a3ae1efcfa2b18b1fc264d6028d45eb7b15f4aac85d5e'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
