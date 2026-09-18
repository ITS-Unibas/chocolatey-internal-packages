$ErrorActionPreference = 'Stop'

$toolsPath = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  silentArgs     = '/S'
  validExitCodes = @(0, 3010, 1605, 1614, 1641)
  softwareName   = 'Zotero'
  url64bit       = 'https://download.zotero.org/client/release/10.0.3/Zotero-10.0.3_x64_setup.exe'
  checksum64     = 'd87dd113f9d7864c822c45a9176342abcaaa672bb3e710bf4b0e2c75bfb0d09f'
  checksumType64 = 'sha256'
}

&(Join-Path $PSScriptRoot InitialScript.ps1)
Install-ChocolateyPackage @packageArgs
&(Join-Path $PSScriptRoot FinalScript.ps1)
