$ErrorActionPreference = 'Stop';

$packageName = 'unibas-msedge-webview2'

$packageArgs = @{
  packageName    = $packageName
  fileType       = 'EXE'
  url            = 'https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/eecdb11d-2025-4dc9-b58c-8c7750f89f33/MicrosoftEdgeWebView2RuntimeInstallerX64.exe'
  silentArgs     = "/silent /install"
  validExitCodes = @(0)
  softwareName   = 'unibas-msedge-webview2*'
  checksum       = 'c0c33addd75c0bf8519c3d7f64981ff93e9221ca6471131c8637ced4a1dfe46a'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
