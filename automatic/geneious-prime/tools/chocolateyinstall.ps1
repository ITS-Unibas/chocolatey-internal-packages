$ErrorActionPreference = 'Stop'

if ((Get-OSArchitectureWidth) -ne 64) {
  throw 'Geneious Prime requires 64-bit Windows.'
}

$logFile = Join-Path $env:TEMP 'geneious-prime.install.log'

$packageArgs = @{
  packageName    = 'geneious-prime'
  fileType       = 'MSI'
  url64          = 'https://assets.geneious.com/installers/geneious/release/Geneious_Prime_win64_2027_0_1_with_jre.msi'
  silentArgs     = " /qn /norestart /l*v `"$($env:temp)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
  validExitCodes = @(0)
  softwareName   = 'Geneious Prime*'
  checksum64     = '3ebeb0e9f5d4c66e58fab77838609c6ab7c3954fb6a7ddb601bdbe4b37afc2ed'
  checksumType64 = 'sha256'
}

Install-ChocolateyPackage @packageArgs
