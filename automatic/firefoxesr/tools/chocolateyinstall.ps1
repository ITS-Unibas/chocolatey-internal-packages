$ErrorActionPreference = 'Stop';


$toolsDir = Split-Path $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName   = 'firefoxesr'
  softwareName  = 'Mozilla Firefox*'
  fileType      = 'MSI'
  unzipLocation = $toolsDir
  url           = 'https://ftp.mozilla.org/pub/firefox/releases/78.7.1esr/win64/en-US/Firefox%20Setup%2078.7.1esr.msi'
  checksum      = 'd0fcb93f82aa1f48bb73713387ed9c333cc2114ce0ec7163b19464f2ed8aea70f072041f578f0666719076d8b3ccf66b1072ba84530670e30f6376b2bcddb304'
  checksumType  = 'sha512'
  silentArgs    = '/quiet /norestart'
  validExitCodes = @(0, 3010)
}

Install-ChocolateyPackage @packageArgs
