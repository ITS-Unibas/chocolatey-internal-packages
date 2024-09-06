$ErrorActionPreference = 'Stop';

$packageName = 'unibas-msedge-webview2'

$packageArgs = @{
  packageName    = $packageName
  fileType       = 'EXE'
  url            = 'https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/6d376ab4-4a07-4679-8918-e0dc3c0735c8/MicrosoftEdgeWebView2RuntimeInstallerX64.exe'
  silentArgs     = "/silent /install"
  validExitCodes = @(0)
  softwareName   = 'unibas-msedge-webview2*'
  checksum       = 'bffddb517ac6e0872eac12862e5b036d8b2fcc57131446e34b90aa2756cfd327'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
