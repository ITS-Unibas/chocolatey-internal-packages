$ErrorActionPreference = 'Stop';

$packageName = 'unibas-msedge-webview2'

$packageArgs = @{
  packageName    = $packageName
  fileType       = 'EXE'
  url            = 'https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/63158e01-aca3-44d4-8c09-0d338d23779d/MicrosoftEdgeWebView2RuntimeInstallerX64.exe'
  silentArgs     = "/silent /install"
  validExitCodes = @(0)
  softwareName   = 'unibas-msedge-webview2*'
  checksum       = '730abae9ec98bebdefbaef8ea75d6fed2801d411040e8b0b02b5ba01534cee48'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
