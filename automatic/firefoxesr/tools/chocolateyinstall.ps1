$ErrorActionPreference = 'Stop';


$toolsDir = Split-Path $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName   = 'firefoxesr'
  softwareName  = 'Mozilla Firefox*'
  fileType      = 'MSI'
  unzipLocation = $toolsDir
  url           = 'https://ftp.mozilla.org/pub/firefox/releases/115.12.0esr/win64/en-US/Firefox%20Setup%20115.12.0esr.msi'
  checksum      = '5c69a036cc2a09b5d48f5504071f6e4250c517b316790f3d86120cd65ad8df6ecf9293cc3597c63f5cf8ddac545ee6bb445b781cb67ff72e48cda3fea520439f'
  checksumType  = 'sha512'
  silentArgs    = '/quiet /norestart'
  validExitCodes = @(0, 3010)
}

Install-ChocolateyPackage @packageArgs
