$ErrorActionPreference = 'Stop';

$packageName = 'unibas-msedge-webview2'

$packageArgs = @{
  packageName    = $packageName
  fileType       = 'EXE'
  url            = 'https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/469a78ad-4352-4c93-912f-c026cb93456c/MicrosoftEdgeWebView2RuntimeInstallerX64.exe'
  silentArgs     = "/silent /install"
  validExitCodes = @(0)
  softwareName   = 'unibas-msedge-webview2*'
  checksum       = '2e4fe09766b9e0e227f92c81bfd6aa359062a3714cacfd5e5d2fba0d9f7008c8'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
