$ErrorActionPreference = 'Stop';

$packageName = 'unibas-msedge-webview2'

$packageArgs = @{
  packageName    = $packageName
  fileType       = 'EXE'
  url            = 'https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/0126536e-e048-416f-923b-202f7f6fa64b/MicrosoftEdgeWebView2RuntimeInstallerX64.exe'
  silentArgs     = "/silent /install"
  validExitCodes = @(0)
  softwareName   = 'unibas-msedge-webview2*'
  checksum       = '2688308af55753c62fda4e8140024e230c1ffc16b7c091b25889572f38dff6e8'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
