$ErrorActionPreference = 'Stop';

$packageName = 'unibas-msedge-webview2'

$packageArgs = @{
  packageName    = $packageName
  fileType       = 'EXE'
  url            = 'https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/f4a2c323-06f3-4a20-9b7f-fbbd28e61af5/MicrosoftEdgeWebView2RuntimeInstallerX64.exe'
  silentArgs     = "/silent /install"
  validExitCodes = @(0)
  softwareName   = 'unibas-msedge-webview2*'
  checksum       = '40a678e90fbebffb400a2f2fdd5056625e4d0d7b8e2df959e838f74c0d907930'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
