$ErrorActionPreference = 'Stop';

$packageName = 'unibas-msedge-webview2'

$packageArgs = @{
  packageName    = $packageName
  fileType       = 'EXE'
  url            = 'https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/f911427a-1082-40e1-a22a-2d30b695fd7a/MicrosoftEdgeWebView2RuntimeInstallerX64.exe'
  silentArgs     = "/silent /install"
  validExitCodes = @(0)
  softwareName   = 'unibas-msedge-webview2*'
  checksum       = 'eb11056572f77dd345427d6f3a2bf9847959c1b8a00b4b5bb9013b2279e7455a'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
