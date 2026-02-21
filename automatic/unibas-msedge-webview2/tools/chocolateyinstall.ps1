$ErrorActionPreference = 'Stop';

$packageName = 'unibas-msedge-webview2'

$packageArgs = @{
  packageName    = $packageName
  fileType       = 'EXE'
  url            = 'https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/486d7a9f-f021-42de-a8f0-f7fa88caa110/MicrosoftEdgeWebView2RuntimeInstallerX64.exe'
  silentArgs     = "/silent /install"
  validExitCodes = @(0)
  softwareName   = 'unibas-msedge-webview2*'
  checksum       = '65334ea5bedfbaeb0ca29a00b2432108b3b5a4708bf1d3b227772f58d6592a1a'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
