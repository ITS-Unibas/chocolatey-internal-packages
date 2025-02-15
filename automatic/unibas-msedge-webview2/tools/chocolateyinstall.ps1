$ErrorActionPreference = 'Stop';

$packageName = 'unibas-msedge-webview2'

$packageArgs = @{
  packageName    = $packageName
  fileType       = 'EXE'
  url            = 'https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/588a97f5-82ab-4508-a494-dc65a9ae5791/MicrosoftEdgeWebView2RuntimeInstallerX64.exe'
  silentArgs     = "/silent /install"
  validExitCodes = @(0)
  softwareName   = 'unibas-msedge-webview2*'
  checksum       = 'ade261e207fac416c7b40e462c2da2a544a03c67c98025a906eeb80e4df4744c'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
