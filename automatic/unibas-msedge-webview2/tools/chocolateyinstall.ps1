$ErrorActionPreference = 'Stop';

$packageName = 'unibas-msedge-webview2'

$packageArgs = @{
  packageName    = $packageName
  fileType       = 'EXE'
  url            = 'https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/1e6286cf-3a77-4ed7-9d9f-789e5c9c6e10/MicrosoftEdgeWebView2RuntimeInstallerX64.exe'
  silentArgs     = "/silent /install"
  validExitCodes = @(0)
  softwareName   = 'unibas-msedge-webview2*'
  checksum       = '57b4b8731044f5c7e60a045a22bbb115428e7eff43e54645cdde2c5ff1f9cbf1'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
