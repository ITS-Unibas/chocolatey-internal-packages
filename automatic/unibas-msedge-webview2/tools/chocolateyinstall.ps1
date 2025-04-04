$ErrorActionPreference = 'Stop';

$packageName = 'unibas-msedge-webview2'

$packageArgs = @{
  packageName    = $packageName
  fileType       = 'EXE'
  url            = 'https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/cea4cf18-02a7-45d4-82ce-c9cbdd22da22/MicrosoftEdgeWebView2RuntimeInstallerX64.exe'
  silentArgs     = "/silent /install"
  validExitCodes = @(0)
  softwareName   = 'unibas-msedge-webview2*'
  checksum       = 'acc0b08a0f8f45de238a5abce55ba48dfb0569b82bb5c57a67817f7a8ec09a00'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
