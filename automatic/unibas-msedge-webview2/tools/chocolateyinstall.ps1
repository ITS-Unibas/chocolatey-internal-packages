$ErrorActionPreference = 'Stop';

$packageName = 'unibas-msedge-webview2'

$packageArgs = @{
  packageName    = $packageName
  fileType       = 'EXE'
  url            = 'https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/a8f5ad97-0b01-41e5-9245-e8fc9ba9b311/MicrosoftEdgeWebView2RuntimeInstallerX64.exe'
  silentArgs     = "/silent /install"
  validExitCodes = @(0)
  softwareName   = 'unibas-msedge-webview2*'
  checksum       = 'e7fa35755196ad9223596ef021a1ce6799509142eaa40ba35f634026be50b831'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
