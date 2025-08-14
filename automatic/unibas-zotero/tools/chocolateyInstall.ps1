$ErrorActionPreference = 'Stop'

$toolsPath = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  silentArgs     = '/S'
  validExitCodes = @(0, 3010, 1605, 1614, 1641)
  softwareName   = 'Zotero'
  url64bit       = 'https://download.zotero.org/client/release/7.0.23/Zotero-7.0.23_x64_setup.exe'
  checksum64     = '8465dc1bda2904e751d8c6b14955f6a4fce50eb17b7cc03ece1eb2cb05d8f54e'
  checksumType64 = 'sha256'
}

&(Join-Path $PSScriptRoot InitialScript.ps1)
Install-ChocolateyPackage @packageArgs
&(Join-Path $PSScriptRoot FinalScript.ps1)
