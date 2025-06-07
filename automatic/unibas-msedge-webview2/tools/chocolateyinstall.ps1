$ErrorActionPreference = 'Stop';

$packageName = 'unibas-msedge-webview2'

$packageArgs = @{
  packageName    = $packageName
  fileType       = 'EXE'
  url            = 'https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/b66a4e63-9084-4d3d-bc7e-1fe47aca92da/MicrosoftEdgeWebView2RuntimeInstallerX64.exe'
  silentArgs     = "/silent /install"
  validExitCodes = @(0)
  softwareName   = 'unibas-msedge-webview2*'
  checksum       = '6bef8b8a42d43a4fec3217a121677b74d74e09722b5e531e41f8058fcbba058d'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
