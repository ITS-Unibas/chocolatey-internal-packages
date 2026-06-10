$ErrorActionPreference = 'Stop';

$packageName = 'unibas-msedge-webview2'

$packageArgs = @{
  packageName    = $packageName
  fileType       = 'EXE'
  url            = 'https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/a8b227e8-58f7-417a-85f9-0b6c4e773904/MicrosoftEdgeWebView2RuntimeInstallerX64.exe'
  silentArgs     = "/silent /install"
  validExitCodes = @(0)
  softwareName   = 'unibas-msedge-webview2*'
  checksum       = '87e43bb3abfb535fa18d77eb5169aba82f10da058aa629dac78916b07446b9f6'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
