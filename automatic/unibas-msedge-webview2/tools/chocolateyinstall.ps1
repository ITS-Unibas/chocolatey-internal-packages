$ErrorActionPreference = 'Stop';

$packageName = 'unibas-msedge-webview2'

$packageArgs = @{
  packageName    = $packageName
  fileType       = 'EXE'
  url            = 'https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/a9d9edbb-41ad-412e-8a0c-e9737c9b4630/MicrosoftEdgeWebView2RuntimeInstallerX64.exe'
  silentArgs     = "/silent /install"
  validExitCodes = @(0)
  softwareName   = 'unibas-msedge-webview2*'
  checksum       = '75e59b2246b4c8edfd393ba91e4fa7dcaee7910e89eaca9c00d9fb7fa9c014f0'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
