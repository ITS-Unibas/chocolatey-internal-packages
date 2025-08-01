$ErrorActionPreference = 'Stop';

$packageName = 'unibas-msedge-webview2'

$packageArgs = @{
  packageName    = $packageName
  fileType       = 'EXE'
  url            = 'https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/b66f752e-a5a7-45cb-b434-48d4ffce70f0/MicrosoftEdgeWebView2RuntimeInstallerX64.exe'
  silentArgs     = "/silent /install"
  validExitCodes = @(0)
  softwareName   = 'unibas-msedge-webview2*'
  checksum       = 'ea0a48ac8c1e577d830bb9b1a1e77f0c8dc241f731baded9bdbf58843942aba8'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
