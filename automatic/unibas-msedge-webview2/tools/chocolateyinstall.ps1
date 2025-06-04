$ErrorActionPreference = 'Stop';

$packageName = 'unibas-msedge-webview2'

$packageArgs = @{
  packageName    = $packageName
  fileType       = 'EXE'
  url            = 'https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/57aade7e-b948-49b0-8f0e-70f861e5bfeb/MicrosoftEdgeWebView2RuntimeInstallerX64.exe'
  silentArgs     = "/silent /install"
  validExitCodes = @(0)
  softwareName   = 'unibas-msedge-webview2*'
  checksum       = '0524484d6cd16fb79e2c147183b73f2d66ac3dc42d68c549b5b8d82ab2e7d388'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
