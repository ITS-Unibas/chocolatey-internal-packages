$ErrorActionPreference = 'Stop';

$packageName = 'unibas-msedge-webview2'

$packageArgs = @{
  packageName    = $packageName
  fileType       = 'EXE'
  url            = 'https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/91530f73-1202-471b-86a9-a3b1d9655560/MicrosoftEdgeWebView2RuntimeInstallerX64.exe'
  silentArgs     = "/silent /install"
  validExitCodes = @(0)
  softwareName   = 'unibas-msedge-webview2*'
  checksum       = '4a6175548ce2fca5850101fd19ec8e58b6a03f1887215151d4623d5a98367106'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
