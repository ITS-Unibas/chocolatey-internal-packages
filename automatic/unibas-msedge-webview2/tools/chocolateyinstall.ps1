$ErrorActionPreference = 'Stop';

$packageName = 'unibas-msedge-webview2'

$packageArgs = @{
  packageName    = $packageName
  fileType       = 'EXE'
  url            = 'https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/d6179690-e992-460b-ae64-476693dd6a91/MicrosoftEdgeWebView2RuntimeInstallerX64.exe'
  silentArgs     = "/silent /install"
  validExitCodes = @(0)
  softwareName   = 'unibas-msedge-webview2*'
  checksum       = 'f9d45cf7bef9576d6df50c7a7525e0bc8c26b6c3bc2c667b494aafb062a35b6f'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
