$ErrorActionPreference = 'Stop';

$packageName = 'unibas-msedge-webview2'

$packageArgs = @{
  packageName    = $packageName
  fileType       = 'EXE'
  url            = 'https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/825b9821-5675-4b57-a531-b39efed6b61f/MicrosoftEdgeWebView2RuntimeInstallerX64.exe'
  silentArgs     = "/silent /install"
  validExitCodes = @(0)
  softwareName   = 'unibas-msedge-webview2*'
  checksum       = 'a515706c0d037426b572b50f2e07f15b914c2e845116411f38ac8827ff1b6596'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
