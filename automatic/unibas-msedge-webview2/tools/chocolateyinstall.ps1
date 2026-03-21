$ErrorActionPreference = 'Stop';

$packageName = 'unibas-msedge-webview2'

$packageArgs = @{
  packageName    = $packageName
  fileType       = 'EXE'
  url            = 'https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/93b00852-0677-4821-87c7-3550fc4308a6/MicrosoftEdgeWebView2RuntimeInstallerX64.exe'
  silentArgs     = "/silent /install"
  validExitCodes = @(0)
  softwareName   = 'unibas-msedge-webview2*'
  checksum       = '0f2f1bf93056f04bd281ab9292e35264a589a599872da6b3571096fda0cf78cb'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
