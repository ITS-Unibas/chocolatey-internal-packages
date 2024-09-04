$ErrorActionPreference = 'Stop';

$packageName = 'unibas-msedge-webview2'

$packageArgs = @{
  packageName    = $packageName
  fileType       = 'EXE'
  url            = 'https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/2b73122e-4aef-4017-9efe-57becc797bc2/MicrosoftEdgeWebView2RuntimeInstallerX64.exe'
  silentArgs     = "/silent /install"
  validExitCodes = @(0)
  softwareName   = 'unibas-msedge-webview2*'
  checksum       = '47c4bcf5f81283d9d6b0e9ef92e16eeaa6e850c5c319f745df5df96229cbfd4d'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
