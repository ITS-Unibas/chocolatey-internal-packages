$ErrorActionPreference = 'Stop'

$toolsPath = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  silentArgs     = '/S'
  validExitCodes = @(0, 3010, 1605, 1614, 1641)
  softwareName   = 'Zotero'
  url64bit       = 'https://download.zotero.org/client/release/7.0.22/Zotero-7.0.22_x64_setup.exe'
  checksum64     = '700642d797f4d258eb6d7b5d2bed152ec66f53cca0c3ea7db48493413f5681a5'
  checksumType64 = 'sha256'
}

&(Join-Path $PSScriptRoot InitialScript.ps1)
Install-ChocolateyPackage @packageArgs
&(Join-Path $PSScriptRoot FinalScript.ps1)
