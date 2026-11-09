$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
    
  url64         = 'https://download.sublimetext.com/sublime_merge_build_2136_x64_setup.exe'
  checksum64    = '397077458d718caf752c2abcf18d4685e91b3a267ed1db52f81841b3bb61df29'
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
