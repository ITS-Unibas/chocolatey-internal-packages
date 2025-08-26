$ErrorActionPreference = 'Stop';

$packageName = 'unibas-msedge-webview2'

$packageArgs = @{
  packageName    = $packageName
  fileType       = 'EXE'
  url            = 'https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/c70676be-2f73-45b2-8c2f-d3b659cf1487/MicrosoftEdgeWebView2RuntimeInstallerX64.exe'
  silentArgs     = "/silent /install"
  validExitCodes = @(0)
  softwareName   = 'unibas-msedge-webview2*'
  checksum       = '62d54ddc763526441aa40a47011f5d7cd8bad110484d790a5b18e6b60b3fc7aa'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
