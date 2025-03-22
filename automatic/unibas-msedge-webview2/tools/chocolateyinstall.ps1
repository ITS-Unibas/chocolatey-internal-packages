$ErrorActionPreference = 'Stop';

$packageName = 'unibas-msedge-webview2'

$packageArgs = @{
  packageName    = $packageName
  fileType       = 'EXE'
  url            = 'https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/58c9e9d6-0423-41bc-8016-f8b6ce8304e6/MicrosoftEdgeWebView2RuntimeInstallerX64.exe'
  silentArgs     = "/silent /install"
  validExitCodes = @(0)
  softwareName   = 'unibas-msedge-webview2*'
  checksum       = 'f52e891b3ce8b3c0e3f5ea9df8f572ef609ee7e2f002d04fdd4bc4ca13949534'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
