$ErrorActionPreference = 'Stop'

$toolsPath = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  silentArgs     = '/S'
  validExitCodes = @(0, 3010, 1605, 1614, 1641)
  softwareName   = 'Zotero'
  url64bit       = 'https://download.zotero.org/client/release/7.0.31/Zotero-7.0.31_x64_setup.exe'
  checksum64     = '5901b7c198670c6d8ed3763f231ef89ea6d51055d1e7082d6c50582855336c0f'
  checksumType64 = 'sha256'
}

&(Join-Path $PSScriptRoot InitialScript.ps1)
Install-ChocolateyPackage @packageArgs
&(Join-Path $PSScriptRoot FinalScript.ps1)
