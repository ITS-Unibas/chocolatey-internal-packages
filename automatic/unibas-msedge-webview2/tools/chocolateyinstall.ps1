$ErrorActionPreference = 'Stop';

$packageName = 'unibas-msedge-webview2'

$packageArgs = @{
  packageName    = $packageName
  fileType       = 'EXE'
  url            = 'https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/d70574c1-e438-4eff-8a87-e32f3cbf13c8/MicrosoftEdgeWebView2RuntimeInstallerX64.exe'
  silentArgs     = "/silent /install"
  validExitCodes = @(0)
  softwareName   = 'unibas-msedge-webview2*'
  checksum       = 'e7c6a6ecca2b8da6962a3461f5510b893c8be7c72291428a44c373bde742dcb0'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
