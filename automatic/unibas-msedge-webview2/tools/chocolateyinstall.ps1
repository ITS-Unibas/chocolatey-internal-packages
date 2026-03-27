$ErrorActionPreference = 'Stop';

$packageName = 'unibas-msedge-webview2'

$packageArgs = @{
  packageName    = $packageName
  fileType       = 'EXE'
  url            = 'https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/df99292c-0587-41b3-b8f7-36870824bee6/MicrosoftEdgeWebView2RuntimeInstallerX64.exe'
  silentArgs     = "/silent /install"
  validExitCodes = @(0)
  softwareName   = 'unibas-msedge-webview2*'
  checksum       = '03cb03e387a4017ec816a659c3727a3c3a44e3f98d771ac37db9304d9fb8a213'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
