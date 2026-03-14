$ErrorActionPreference = 'Stop';

$packageName = 'unibas-msedge-webview2'

$packageArgs = @{
  packageName    = $packageName
  fileType       = 'EXE'
  url            = 'https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/6c1ff3e4-7efe-4c84-bd84-730b02aebe65/MicrosoftEdgeWebView2RuntimeInstallerX64.exe'
  silentArgs     = "/silent /install"
  validExitCodes = @(0)
  softwareName   = 'unibas-msedge-webview2*'
  checksum       = 'b4b5ce9df448c81c6bc8b497883bf2679ed197b3690491a58c040e8a29617da2'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
