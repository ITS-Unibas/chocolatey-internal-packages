$ErrorActionPreference = 'Stop'

$toolsDir = Split-Path -Parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  softwareName   = 'FileZilla*'
  file64         = Join-Path $toolsDir "FileZilla_3.69.6_win64-setup.exe"
  fileType       = 'EXE'
  silentArgs     = '/S'
  validExitCodes = @(0, 3010, 1605, 1614, 1641, 1223)
}

&(Join-Path $PSScriptRoot InitialScript.ps1)
Install-ChocolateyInstallPackage @packageArgs
&(Join-Path $PSScriptRoot FinalScript.ps1)
