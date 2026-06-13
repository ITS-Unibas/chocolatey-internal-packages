$ErrorActionPreference = 'Stop';

$packageName = 'unibas-msedge-webview2'

$packageArgs = @{
  packageName    = $packageName
  fileType       = 'EXE'
  url            = 'https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/5130f1f3-b51b-4ea1-bfac-4a3e2b6a78bb/MicrosoftEdgeWebView2RuntimeInstallerX64.exe'
  silentArgs     = "/silent /install"
  validExitCodes = @(0)
  softwareName   = 'unibas-msedge-webview2*'
  checksum       = 'af1067d9cc7f107ca96ddd8d5212724bdae3bd9eb46e619d2ca5c1f3e3041612'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
