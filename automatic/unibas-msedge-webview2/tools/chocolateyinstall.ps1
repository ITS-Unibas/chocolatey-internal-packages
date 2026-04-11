$ErrorActionPreference = 'Stop';

$packageName = 'unibas-msedge-webview2'

$packageArgs = @{
  packageName    = $packageName
  fileType       = 'EXE'
  url            = 'https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/0622d6c1-fc78-41a1-88d9-7097d919158f/MicrosoftEdgeWebView2RuntimeInstallerX64.exe'
  silentArgs     = "/silent /install"
  validExitCodes = @(0)
  softwareName   = 'unibas-msedge-webview2*'
  checksum       = '4ad5bc8bc53ba3d4a4f71bd964ca0aa9926e6ba04f936e2778363cd23123d159'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
