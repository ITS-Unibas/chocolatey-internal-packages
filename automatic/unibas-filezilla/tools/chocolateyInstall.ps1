$ErrorActionPreference = 'Stop'

$toolsDir = Split-Path -Parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  softwareName   = 'FileZilla*'
  file           = Join-Path $toolsDir "FileZilla_$($env:ChocolateyPackageVersion)_win64-setup.exe"
  fileType       = 'EXE'
  silentArgs     = '/S'
  validExitCodes = @(0, 1223)
}

&(Join-Path $PSScriptRoot InitialScript.ps1)
Install-ChocolateyInstallPackage @packageArgs
