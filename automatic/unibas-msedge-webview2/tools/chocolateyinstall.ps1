$ErrorActionPreference = 'Stop';

$packageName = 'unibas-msedge-webview2'

$packageArgs = @{
  packageName    = $packageName
  fileType       = 'EXE'
  url            = 'https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/0b84ad9a-99dd-480b-a26e-c9e5cbabb6a1/MicrosoftEdgeWebView2RuntimeInstallerX64.exe'
  silentArgs     = "/silent /install"
  validExitCodes = @(0)
  softwareName   = 'unibas-msedge-webview2*'
  checksum       = '5ee7e533c87d9af4cfcb2f0602fd000a874feaa72e798f951257f85dc6c799b3'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
