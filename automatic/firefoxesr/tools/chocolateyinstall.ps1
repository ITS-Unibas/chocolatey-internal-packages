$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = 'firefoxesr'
  softwareName  = 'Mozilla Firefox*'
  fileType      = 'MSI'
  url           = 'https://ftp.mozilla.org/pub/firefox/releases/128.3.1esr/win64/en-US/Firefox%20Setup%20128.3.1esr.msi'
  checksum      = '9e294e72114041f417e6b8f8f556a35c0ac9bcb373f79f44b281c2ed736ac100'
  checksumType  = 'sha256'
  silentArgs    = '/quiet /norestart'
  validExitCodes = @(0, 3010)
}

Install-ChocolateyPackage @packageArgs
