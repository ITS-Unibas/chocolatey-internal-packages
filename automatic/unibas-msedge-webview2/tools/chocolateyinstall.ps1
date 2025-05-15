$ErrorActionPreference = 'Stop';

$packageName = 'unibas-msedge-webview2'

$packageArgs = @{
  packageName    = $packageName
  fileType       = 'EXE'
  url            = 'https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/1c36f3d1-a399-48d4-9a09-0630b62bbda3/MicrosoftEdgeWebView2RuntimeInstallerX64.exe'
  silentArgs     = "/silent /install"
  validExitCodes = @(0)
  softwareName   = 'unibas-msedge-webview2*'
  checksum       = '63d79cae93f821b4883924d65bdfc5cbe25f3e7a7c20ac031e8a6df303dc3976'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
