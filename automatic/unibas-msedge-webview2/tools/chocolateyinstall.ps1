$ErrorActionPreference = 'Stop';

$packageName = 'unibas-msedge-webview2'

$packageArgs = @{
  packageName    = $packageName
  fileType       = 'EXE'
  url            = 'https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/c06df675-b17f-4d50-8582-7a9b2c24e3c8/MicrosoftEdgeWebView2RuntimeInstallerX64.exe'
  silentArgs     = "/silent /install"
  validExitCodes = @(0)
  softwareName   = 'unibas-msedge-webview2*'
  checksum       = '08a5a60765ea20b7033c5a264fb20a5b1cca7018179e13cefcecdb1621c30ac1'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
