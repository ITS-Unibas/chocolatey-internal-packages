$ErrorActionPreference = 'Stop';

$packageName = 'unibas-msedge-webview2'

$packageArgs = @{
  packageName    = $packageName
  fileType       = 'EXE'
  url            = 'https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/e23fa686-5b0b-4957-b3bc-7235bb4f6816/MicrosoftEdgeWebView2RuntimeInstallerX64.exe'
  silentArgs     = "/silent /install"
  validExitCodes = @(0)
  softwareName   = 'unibas-msedge-webview2*'
  checksum       = 'aa48dda6394326b07ad43dc03fa4cae2dd858bec4496c1aa3833370945a24c81'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
