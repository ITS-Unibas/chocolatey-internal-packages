$ErrorActionPreference = 'Stop';

$packageName = 'unibas-msedge-webview2'

$packageArgs = @{
  packageName    = $packageName
  fileType       = 'EXE'
  url            = 'https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/199041ce-790a-4bbc-9111-b81b4c926e9f/MicrosoftEdgeWebView2RuntimeInstallerX64.exe'
  silentArgs     = "/silent /install"
  validExitCodes = @(0)
  softwareName   = 'unibas-msedge-webview2*'
  checksum       = '1be9d2926954d99dd62653a22efe813160fe0c40f1e422b44e6aaf5473f68eec'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
