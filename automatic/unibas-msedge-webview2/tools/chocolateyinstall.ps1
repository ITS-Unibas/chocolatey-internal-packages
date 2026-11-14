$ErrorActionPreference = 'Stop';

$packageName = 'unibas-msedge-webview2'

$packageArgs = @{
  packageName    = $packageName
  fileType       = 'EXE'
  url            = 'https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/52cfd0a8-f256-48d4-9b18-467f2b3cda78/MicrosoftEdgeWebView2RuntimeInstallerX64.exe'
  silentArgs     = "/silent /install"
  validExitCodes = @(0)
  softwareName   = 'unibas-msedge-webview2*'
  checksum       = 'd3cbe8fedb104282d745fff106993efead51ae94f5595a4e75804446a974f9c3'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
