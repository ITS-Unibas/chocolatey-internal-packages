$ErrorActionPreference = 'Stop';

$packageName = 'unibas-msedge-webview2'

$packageArgs = @{
  packageName    = $packageName
  fileType       = 'EXE'
  url            = 'https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/2e372271-55ba-41c0-89b9-dfc306dee437/MicrosoftEdgeWebView2RuntimeInstallerX64.exe'
  silentArgs     = "/silent /install"
  validExitCodes = @(0)
  softwareName   = 'unibas-msedge-webview2*'
  checksum       = '8edca17bb292e88072c043a28f2d90168deed95be4ab2b8b143d5d9c86690266'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
