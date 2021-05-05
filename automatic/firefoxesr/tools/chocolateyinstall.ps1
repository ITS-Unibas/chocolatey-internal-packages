$ErrorActionPreference = 'Stop';


$toolsDir = Split-Path $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName   = 'firefoxesr'
  softwareName  = 'Mozilla Firefox*'
  fileType      = 'MSI'
  unzipLocation = $toolsDir
  url           = 'https://ftp.mozilla.org/pub/firefox/releases/78.10.1esr/win64/en-US/Firefox%20Setup%2078.10.1esr.msi'
  checksum      = 'cc59b50247d57cd487bf62c87d94d52878d13b51cc67aa357d91dc813edaf27d47a29cce36063001b2e72ee06041e3bdf5ba34c2bfef9e7ceabf68f63feeec72'
  checksumType  = 'sha512'
  silentArgs    = '/quiet /norestart'
  validExitCodes = @(0, 3010)
}

Install-ChocolateyPackage @packageArgs
