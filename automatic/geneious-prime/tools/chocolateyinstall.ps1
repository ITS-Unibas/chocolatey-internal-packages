$ErrorActionPreference = 'Stop'

if ((Get-OSArchitectureWidth) -ne 64) {
  throw 'Geneious Prime requires 64-bit Windows.'
}

$logFile = Join-Path $env:TEMP 'geneious-prime.install.log'

$packageArgs = @{
  packageName    = 'geneious-prime'
  fileType       = 'MSI'
  url64          = 'https://assets.geneious.com/installers/geneious/release/Geneious_Prime_win64_2026_1_4_with_jre.msi'
  silentArgs     = " /qn /norestart /l*v `"$($env:temp)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
  validExitCodes = @(0)
  softwareName   = 'Geneious Prime*'
  checksum64     = '746b74262fe7704e67cc9035094db0c2a5302c2c3729365c06c4018d5e7e00cf'
  checksumType64 = 'sha256'
}

Install-ChocolateyPackage @packageArgs
