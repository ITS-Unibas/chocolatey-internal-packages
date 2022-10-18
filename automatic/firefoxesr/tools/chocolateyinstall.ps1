$ErrorActionPreference = 'Stop';


$toolsDir = Split-Path $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName   = 'firefoxesr'
  softwareName  = 'Mozilla Firefox*'
  fileType      = 'MSI'
  unzipLocation = $toolsDir
  url           = 'https://ftp.mozilla.org/pub/firefox/releases/102.4.0esr/win64/en-US/Firefox%20Setup%20102.4.0esr.msi'
  checksum      = '54a2e8815d7a75267216f886bb0e4db2babd993b3b664d34368b7581804e84cd2d52677d4fcde01365ce212eaa1f497f553483d503f0bfde4e3067b1448e2e41'
  checksumType  = 'sha512'
  silentArgs    = '/quiet /norestart'
  validExitCodes = @(0, 3010)
}

Install-ChocolateyPackage @packageArgs
