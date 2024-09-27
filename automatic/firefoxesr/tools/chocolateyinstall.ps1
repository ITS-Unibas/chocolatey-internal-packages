$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = 'firefoxesr'
  softwareName  = 'Mozilla Firefox*'
  fileType      = 'MSI'
  url           = 'https://ftp.mozilla.org/pub/firefox/releases/128.1.0esr/win64/en-US/Firefox%20Setup%20128.1.0esr.msi'
  checksum      = 'ece306bfc2de3dcbb9bcf7487ce53499d5e7bc5b334b0e6426a95fb314829f7b3b371082b80742bf96ad547875d16047a429fca27e5fc1ebd6e397505983413a'
  checksumType  = 'sha512'
  silentArgs    = '/quiet /norestart'
  validExitCodes = @(0, 3010)
}

Install-ChocolateyPackage @packageArgs
