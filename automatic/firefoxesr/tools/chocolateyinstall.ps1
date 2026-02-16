$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = 'firefoxesr'
  softwareName  = 'Mozilla Firefox*'
  fileType      = 'MSI'
  url           = 'https://ftp.mozilla.org/pub/firefox/releases/140.7.1esr/win64/en-US/Firefox%20Setup%20140.7.1esr.msi'
  checksum      = 'df08686693e8f237c7a5c7056e863c66afe80458acc1bd141f5dddd3a58e5552'
  checksumType  = 'sha256'
  silentArgs    = '/quiet /norestart'
  validExitCodes = @(0, 3010)
}

Install-ChocolateyPackage @packageArgs
