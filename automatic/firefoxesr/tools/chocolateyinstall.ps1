$ErrorActionPreference = 'Stop';


$toolsDir = Split-Path $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName   = 'firefoxesr'
  softwareName  = 'Mozilla Firefox*'
  fileType      = 'MSI'
  unzipLocation = $toolsDir
  url           = 'https://ftp.mozilla.org/pub/firefox/releases/78.3.0esr/win64/en-US/Firefox%20Setup%2078.3.0esr.msi'
  checksum      = 'b81adab1edebd18d87e4abb0e819e4eea3b40357361324c2d62a03a42f28f93d9c04e1247f7ce97bfd0d5c898150e12cc313e7c6909e2cedc0bc456d45bfa053'
  checksumType  = 'sha512'
  silentArgs    = '/quiet /norestart'
  validExitCodes = @(0, 3010)
}

Install-ChocolateyPackage @packageArgs
