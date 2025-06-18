$ErrorActionPreference = 'Stop';

$packageName = 'unibas-msedge-webview2'

$packageArgs = @{
  packageName    = $packageName
  fileType       = 'EXE'
  url            = 'https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/cb484747-a4c4-42ef-b10c-656583e9f754/MicrosoftEdgeWebView2RuntimeInstallerX64.exe'
  silentArgs     = "/silent /install"
  validExitCodes = @(0)
  softwareName   = 'unibas-msedge-webview2*'
  checksum       = '4daff8071bc6ad686c4ed42a9babe938a9a6e3b3f8fc98eff3f669898897bb60'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
