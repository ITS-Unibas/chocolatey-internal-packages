$ErrorActionPreference = 'Stop';

$packageName = 'unibas-oxygen-xml-editor'

$packageArgs = @{
  packageName    = $packageName
  fileType       = 'EXE'
  url            = 'https://mirror.oxygenxml.com/InstData/Editor/Windows64/VM/oxygen-64bit-openjdk.exe'
  silentArgs     = "/silent /install"
  validExitCodes = @(0)
  softwareName   = 'unibas-oxygen-xml-editor*'
  checksum       = '6e1ee9db4f805616e0baca3f4f2a87ac348d0ab631b0a55467b3242ecee5b6c5'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
