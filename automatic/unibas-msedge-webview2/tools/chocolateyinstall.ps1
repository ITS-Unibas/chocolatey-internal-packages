$ErrorActionPreference = 'Stop';

$packageName = 'unibas-msedge-webview2'

$packageArgs = @{
  packageName    = $packageName
  fileType       = 'EXE'
  url            = 'https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/05f7af6d-438b-4f0b-9a3b-4474fec106a4/MicrosoftEdgeWebView2RuntimeInstallerX64.exe'
  silentArgs     = "/silent /install"
  validExitCodes = @(0)
  softwareName   = 'unibas-msedge-webview2*'
  checksum       = 'a6b229409562fe4bd3575e1e87e143a382a60551a9b81de00e2697b3b717774c'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
