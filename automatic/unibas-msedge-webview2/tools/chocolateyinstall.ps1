$ErrorActionPreference = 'Stop';

$packageName = 'unibas-msedge-webview2'

$packageArgs = @{
  packageName    = $packageName
  fileType       = 'EXE'
  url            = 'https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/80f3ef0f-905f-4a9b-821b-51ec26b06ef2/MicrosoftEdgeWebView2RuntimeInstallerX64.exe'
  silentArgs     = "/silent /install"
  validExitCodes = @(0)
  softwareName   = 'unibas-msedge-webview2*'
  checksum       = '1f4638309f3d82c31a3028c3cf7d75998f58e4d1407380f5cb8a8e9172caf17d'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
