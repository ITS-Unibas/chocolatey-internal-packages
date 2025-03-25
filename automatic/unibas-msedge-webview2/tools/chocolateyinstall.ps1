$ErrorActionPreference = 'Stop';

$packageName = 'unibas-msedge-webview2'

$packageArgs = @{
  packageName    = $packageName
  fileType       = 'EXE'
  url            = 'https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/289c51fc-915f-45a6-a434-51b8c2fe69a9/MicrosoftEdgeWebView2RuntimeInstallerX64.exe'
  silentArgs     = "/silent /install"
  validExitCodes = @(0)
  softwareName   = 'unibas-msedge-webview2*'
  checksum       = '5821b5d7437ed3040df01f4995db074fbac8373b28bf48421ae7138b7a229856'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
