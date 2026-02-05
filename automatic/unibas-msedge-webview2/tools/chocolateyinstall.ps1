$ErrorActionPreference = 'Stop';

$packageName = 'unibas-msedge-webview2'

$packageArgs = @{
  packageName    = $packageName
  fileType       = 'EXE'
  url            = 'https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/7bd9a9f7-12ec-4aa5-a4ac-5e8012849052/MicrosoftEdgeWebView2RuntimeInstallerX64.exe'
  silentArgs     = "/silent /install"
  validExitCodes = @(0)
  softwareName   = 'unibas-msedge-webview2*'
  checksum       = '30efa9479fbc8478fc6d7c7022d59dbdc9736b5afcb59ad89b9c918911bd617b'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
