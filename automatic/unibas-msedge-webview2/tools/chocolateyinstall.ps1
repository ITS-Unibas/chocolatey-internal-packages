$ErrorActionPreference = 'Stop';

$packageName = 'unibas-msedge-webview2'

$packageArgs = @{
  packageName    = $packageName
  fileType       = 'EXE'
  url            = 'https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/9f894531-f31c-4fe8-8678-2ced4725def4/MicrosoftEdgeWebView2RuntimeInstallerX64.exe'
  silentArgs     = "/silent /install"
  validExitCodes = @(0)
  softwareName   = 'unibas-msedge-webview2*'
  checksum       = '3505a37b54a294c2bc423b30d6c02cd33a2e58dbcdc7e03b50d7a4112746c986'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
