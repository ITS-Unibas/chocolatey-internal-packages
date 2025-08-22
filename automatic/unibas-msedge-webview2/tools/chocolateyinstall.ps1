$ErrorActionPreference = 'Stop';

$packageName = 'unibas-msedge-webview2'

$packageArgs = @{
  packageName    = $packageName
  fileType       = 'EXE'
  url            = 'https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/0d95f327-a869-4d28-9746-2212baa3228f/MicrosoftEdgeWebView2RuntimeInstallerX64.exe'
  silentArgs     = "/silent /install"
  validExitCodes = @(0)
  softwareName   = 'unibas-msedge-webview2*'
  checksum       = '6b65667b02aae0e0088bf9d945a3f476bba1afa459da069d4c439e727794ca88'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
