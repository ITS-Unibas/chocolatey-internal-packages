$ErrorActionPreference = 'Stop';

$packageName = 'unibas-msedge-webview2'

$packageArgs = @{
  packageName    = $packageName
  fileType       = 'EXE'
  url            = 'https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/b989c718-2e60-46bb-956d-605d24cf11a6/MicrosoftEdgeWebView2RuntimeInstallerX64.exe'
  silentArgs     = "/silent /install"
  validExitCodes = @(0)
  softwareName   = 'unibas-msedge-webview2*'
  checksum       = 'e8464b185b4786f43e9c7357eea6a0e64f25b1e3bf841e1db0f7a0e9e8a9d090'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
