$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = 'firefoxesr'
  softwareName  = 'Mozilla Firefox*'
  fileType      = 'MSI'
  url           = 'https://ftp.mozilla.org/pub/firefox/releases/140.8.0esr/win64/en-US/Firefox%20Setup%20140.8.0esr.msi'
  checksum      = '4f132fccc861a1a585d65c61a5d6cd4e2691a483348109cf1641d45cfb59fc64'
  checksumType  = 'sha256'
  silentArgs    = '/quiet /norestart'
  validExitCodes = @(0, 3010)
}

Install-ChocolateyPackage @packageArgs
