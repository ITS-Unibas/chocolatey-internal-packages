$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = 'firefoxesr'
  softwareName  = 'Mozilla Firefox*'
  fileType      = 'MSI'
  url           = 'https://ftp.mozilla.org/pub/firefox/releases/140.15.0esr/win64/en-US/Firefox%20Setup%20140.15.0esr.msi'
  checksum      = 'ef17e2f7ec5186c837ac53bd647f00ba89e8865f9851d01769d302f80f977397'
  checksumType  = 'sha256'
  silentArgs    = '/quiet /norestart'
  validExitCodes = @(0, 3010)
}

Install-ChocolateyPackage @packageArgs
