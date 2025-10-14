$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = 'firefoxesr'
  softwareName  = 'Mozilla Firefox*'
  fileType      = 'MSI'
  url           = 'https://ftp.mozilla.org/pub/firefox/releases/140.4.0esr/win64/en-US/Firefox%20Setup%20140.4.0esr.msi'
  checksum      = '5c83a06d68c94ba018af117d858e0c874dd61e81124a854c8eb24ee9f0eed3c4'
  checksumType  = 'sha256'
  silentArgs    = '/quiet /norestart'
  validExitCodes = @(0, 3010)
}

Install-ChocolateyPackage @packageArgs
