$ErrorActionPreference = 'Stop';
$packageName = $env:ChocolateyPackageName
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$packageArgs = @{
  file = (Join-Path $toolsDir 'audacity-win-3.7.5-64bit.exe')
  packageName = $env:ChocolateyPackageName
  unzipLocation  = $toolsDir
  fileType       = 'EXE'
  silentArgs     = '/VERYSILENT /NORESTART'
  validExitCodes = @(0, 3010, 1605, 1614, 1641)
  softwareName   = 'Audacity'
}
&(Join-Path $PSScriptRoot InitialScript.ps1)
Install-ChocolateyPackage @packageArgs
&(Join-Path $PSScriptRoot FinalScript.ps1)

