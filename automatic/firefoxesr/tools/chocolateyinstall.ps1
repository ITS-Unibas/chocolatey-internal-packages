$ErrorActionPreference = 'Stop';


$toolsDir = Split-Path $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName   = 'firefoxesr'
  softwareName  = 'Mozilla Firefox*'
  fileType      = 'MSI'
  unzipLocation = $toolsDir
  url           = 'https://ftp.mozilla.org/pub/firefox/releases/115.2.0esr/win64/en-US/Firefox%20Setup%20115.2.0esr.msi'
  checksum      = 'd56b6a26551aeb212afb5b7b23ea73ef67cba7b48ee045f14e484e8f72d69c09a23168c8ffddfabdb3d0042a19c903728b0091f54cb672a98f2fe40deb06af3b'
  checksumType  = 'sha512'
  silentArgs    = '/quiet /norestart'
  validExitCodes = @(0, 3010)
}

Install-ChocolateyPackage @packageArgs
