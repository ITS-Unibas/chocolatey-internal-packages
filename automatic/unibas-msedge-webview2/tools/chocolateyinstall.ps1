$ErrorActionPreference = 'Stop';

$packageName = 'unibas-msedge-webview2'

$packageArgs = @{
  packageName    = $packageName
  fileType       = 'EXE'
  url            = 'https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/5438194f-50fd-42d4-a059-6ed4e13b4f9a/MicrosoftEdgeWebView2RuntimeInstallerX64.exe'
  silentArgs     = "/silent /install"
  validExitCodes = @(0)
  softwareName   = 'unibas-msedge-webview2*'
  checksum       = '0712ad760da145ec17f876c6cdfa0d9b2bee86ef50687ace9439dd221690eb98'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
