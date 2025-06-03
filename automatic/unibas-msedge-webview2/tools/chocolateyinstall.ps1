$ErrorActionPreference = 'Stop';

$packageName = 'unibas-msedge-webview2'

$packageArgs = @{
  packageName    = $packageName
  fileType       = 'EXE'
  url            = 'https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/f8d57f55-2757-42b8-82e3-4050ea7dfbba/MicrosoftEdgeWebView2RuntimeInstallerX64.exe'
  silentArgs     = "/silent /install"
  validExitCodes = @(0)
  softwareName   = 'unibas-msedge-webview2*'
  checksum       = '0561f2892ce7c8ecc5066f19c7cc1bbfce7a24ef8b85e8ae2cd1660e03b75a95'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
