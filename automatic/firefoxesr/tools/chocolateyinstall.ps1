$ErrorActionPreference = 'Stop';


$toolsDir = Split-Path $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName   = 'firefoxesr'
  softwareName  = 'Mozilla Firefox*'
  fileType      = 'MSI'
  unzipLocation = $toolsDir
  url           = 'https://ftp.mozilla.org/pub/firefox/releases/115.7.0esr/win64/en-US/Firefox%20Setup%20115.7.0esr.msi'
  checksum      = 'e745e1f6af57a3360b82c62ce6097e62aaf63369856a08a3e1407221d7a08b3137c134dec899a448283c2795a29e63e62bcf4bcc163c4d39c51fc25a34972a44'
  checksumType  = 'sha512'
  silentArgs    = '/quiet /norestart'
  validExitCodes = @(0, 3010)
}

Install-ChocolateyPackage @packageArgs
