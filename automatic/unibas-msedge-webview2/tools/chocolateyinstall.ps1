$ErrorActionPreference = 'Stop';

$packageName = 'unibas-msedge-webview2'

$packageArgs = @{
  packageName    = $packageName
  fileType       = 'EXE'
  url            = 'https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/22ced09c-d6bd-4427-a658-f1dc48f3a440/MicrosoftEdgeWebView2RuntimeInstallerX64.exe'
  silentArgs     = "/silent /install"
  validExitCodes = @(0)
  softwareName   = 'unibas-msedge-webview2*'
  checksum       = '82b2d8a7013e0c0ea15d48ff4742ee3778ba16bd8b7b4a47876645b3e48d4016'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
