$ErrorActionPreference = 'Stop';

$packageName = 'unibas-msedge-webview2'

$packageArgs = @{
  packageName    = $packageName
  fileType       = 'EXE'
  url            = 'https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/b7e683e6-e94c-4576-bfe5-34852785a4d6/MicrosoftEdgeWebView2RuntimeInstallerX64.exe'
  silentArgs     = "/silent /install"
  validExitCodes = @(0)
  softwareName   = 'unibas-msedge-webview2*'
  checksum       = '987a9d8b3107e84f9b53b4a077d28ae4814fc3d964d5a55c559e7334bbf24d61'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
