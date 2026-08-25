$ErrorActionPreference = 'Stop'

$toolsPath = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  silentArgs     = '/S'
  validExitCodes = @(0, 3010, 1605, 1614, 1641)
  softwareName   = 'Zotero'
  url64bit       = 'https://download.zotero.org/client/release/10.0.1/Zotero-10.0.1_x64_setup.exe'
  checksum64     = '4b0f508ef28bff9a7b6cc2299eb18f2431d966d91a462ce29e5bc609d5e07036'
  checksumType64 = 'sha256'
}

&(Join-Path $PSScriptRoot InitialScript.ps1)
Install-ChocolateyPackage @packageArgs
&(Join-Path $PSScriptRoot FinalScript.ps1)
