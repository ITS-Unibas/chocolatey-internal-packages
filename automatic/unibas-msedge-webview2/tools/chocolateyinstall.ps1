$ErrorActionPreference = 'Stop';

$packageName = 'unibas-msedge-webview2'

$packageArgs = @{
  packageName    = $packageName
  fileType       = 'EXE'
  url            = 'https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/b5e242e2-acf4-4414-85c3-1a4dfe51a528/MicrosoftEdgeWebView2RuntimeInstallerX64.exe'
  silentArgs     = "/silent /install"
  validExitCodes = @(0)
  softwareName   = 'unibas-msedge-webview2*'
  checksum       = 'f5acc1c3b41c89d6bf0bff79c6097b9ac7fe10812f6b268f52a040385b0886c0'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
