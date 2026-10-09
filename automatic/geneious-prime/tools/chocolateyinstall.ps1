$ErrorActionPreference = 'Stop'

if ((Get-OSArchitectureWidth) -ne 64) {
  throw 'Geneious Prime requires 64-bit Windows.'
}

$logFile = Join-Path $env:TEMP 'geneious-prime.install.log'

$packageArgs = @{
  packageName    = 'geneious-prime'
  fileType       = 'exe'
  url64          = 'https://assets.geneious.com/installers/geneious/release/Geneious_Prime_win64_2026_1_4_with_jre.exe'
  silentArgs     = "-q -overwrite -Dinstall4j.suppressUnattendedReboot=true -Dinstall4j.log=`"$logFile`""
  validExitCodes = @(0)
  softwareName   = 'Geneious Prime*'
  checksum64     = 'f4805a64d5091ae681a922904be331bbacff369d98ee1522e9c85e8dec8532d4'
  checksumType64 = 'sha256'
}

Install-ChocolateyPackage @packageArgs
