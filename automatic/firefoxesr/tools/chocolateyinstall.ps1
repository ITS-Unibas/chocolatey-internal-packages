$ErrorActionPreference = 'Stop';


$toolsDir = Split-Path $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName   = 'firefoxesr'
  softwareName  = 'Mozilla Firefox*'
  fileType      = 'MSI'
  unzipLocation = $toolsDir
  url           = 'https://ftp.mozilla.org/pub/firefox/releases/91.3.0esr/win64/en-US/Firefox%20Setup%2091.3.0esr.msi'
  checksum      = 'c97b91f331a93e2c38924b20c18a877dab1506a17a7acb714e22fe19bb8eae948e9035c0b983d93d10c3ca3f8453b89a2816894cc50ffa10a2e5b49a4518fddb'
  checksumType  = 'sha512'
  silentArgs    = '/quiet /norestart'
  validExitCodes = @(0, 3010)
}

Install-ChocolateyPackage @packageArgs
