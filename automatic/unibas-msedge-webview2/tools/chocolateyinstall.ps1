$ErrorActionPreference = 'Stop';

$packageName = 'unibas-msedge-webview2'

$packageArgs = @{
  packageName    = $packageName
  fileType       = 'EXE'
  url            = 'https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/ebea1897-413e-4de3-9cdf-8591f9efed8f/MicrosoftEdgeWebView2RuntimeInstallerX64.exe'
  silentArgs     = "/silent /install"
  validExitCodes = @(0)
  softwareName   = 'unibas-msedge-webview2*'
  checksum       = '0b5455ac6b0201d60a6bf7bea711d8dfa7860fb1a052dfae4d3e176933a91ff1'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
