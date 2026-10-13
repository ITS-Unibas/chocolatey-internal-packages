$ErrorActionPreference = 'Stop'

if ((Get-OSArchitectureWidth) -ne 64) {
  throw 'Geneious Prime requires 64-bit Windows.'
}

$logFile = Join-Path $env:TEMP 'geneious-prime.install.log'

$packageArgs = @{
  packageName    = 'geneious-prime'
  fileType       = 'MSI'
  url64          = ''
  silentArgs     = " /qn /norestart /l*v `"$($env:temp)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
  validExitCodes = @(0)
  softwareName   = 'Geneious Prime*'
  checksum64     = ''
  checksumType64 = 'sha256'
}

Install-ChocolateyPackage @packageArgs
