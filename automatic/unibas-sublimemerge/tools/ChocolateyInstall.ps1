$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
    
  url64         = ''
  checksum64    = ''
  checksumType  = 'sha256'
  validExitCodes = @(0, 3010, 1605, 1614, 1641)
  silentArgs	= "/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-"
  softwareName   = 'sublimemerge'
}

&(Join-Path $PSScriptRoot InitialScript.ps1)
Install-ChocolateyPackage @packageArgs
&(Join-Path $PSScriptRoot FinalScript.ps1)

[array]$key = Get-UninstallRegistryKey @packageArgs
If ($key.Count -eq 1) {
  $key | ForEach-Object {
    $submergeInstallLocation = Join-Path -Path $_.InstallLocation -ChildPath 'smerge.exe'
    Install-BinFile -Name 'smerge' -Path "$submergeInstallLocation"
  }
}
