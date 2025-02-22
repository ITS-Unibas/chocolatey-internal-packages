$ErrorActionPreference = 'Stop';

$packageName = 'unibas-msedge-webview2'

$packageArgs = @{
  packageName    = $packageName
  fileType       = 'EXE'
  url            = 'https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/4ad86234-0e47-470c-816b-23b0200ca9b2/MicrosoftEdgeWebView2RuntimeInstallerX64.exe'
  silentArgs     = "/silent /install"
  validExitCodes = @(0)
  softwareName   = 'unibas-msedge-webview2*'
  checksum       = '373b443d14002c869f8fb0b5ce2a58f40def2eb6864cd51a6ddcc5699c5e7b42'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
