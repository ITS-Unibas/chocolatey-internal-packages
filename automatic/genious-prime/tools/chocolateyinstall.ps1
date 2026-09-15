$ErrorActionPreference = 'Stop'

if ((Get-OSArchitectureWidth) -ne 64) {
  throw 'Geneious Prime requires 64-bit Windows.'
}

$logFile = Join-Path $env:TEMP 'geneious-prime.install.log'

$packageArgs = @{
  packageName    = 'geneious-prime'
  fileType       = 'exe'
  url64          = 'https://assets.geneious.com/installers/geneious/release/Geneious_Prime_win64_2026_1_3_with_jre.exe'
  silentArgs     = "-q -overwrite -Dinstall4j.suppressUnattendedReboot=true -Dinstall4j.log=`"$logFile`""
  validExitCodes = @(0)
  softwareName   = 'Geneious Prime*'
  checksum64     = '86cebaedd1bc838a643e56a9fd34a68ecce856eecaa1ec68d2af53d17c20a440'
  checksumType64 = 'sha256'
}

Install-ChocolateyPackage @packageArgs
