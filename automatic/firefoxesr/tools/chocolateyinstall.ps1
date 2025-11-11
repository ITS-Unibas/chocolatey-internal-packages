$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = 'firefoxesr'
  softwareName  = 'Mozilla Firefox*'
  fileType      = 'MSI'
  url           = 'https://ftp.mozilla.org/pub/firefox/releases/140.5.0esr/win64/en-US/Firefox%20Setup%20140.5.0esr.msi'
  checksum      = '05b111532e2996224d03e26bb01fd830b803afee755ee951bf331a2d41c41364'
  checksumType  = 'sha256'
  silentArgs    = '/quiet /norestart'
  validExitCodes = @(0, 3010)
}

Install-ChocolateyPackage @packageArgs
