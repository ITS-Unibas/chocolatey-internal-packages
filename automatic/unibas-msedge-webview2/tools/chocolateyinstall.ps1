$ErrorActionPreference = 'Stop';

$packageName = 'unibas-msedge-webview2'

$packageArgs = @{
  packageName    = $packageName
  fileType       = 'EXE'
  url            = 'https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/92da24d5-13a1-4d0c-8592-b6056b909dd4/MicrosoftEdgeWebView2RuntimeInstallerX64.exe'
  silentArgs     = "/silent /install"
  validExitCodes = @(0)
  softwareName   = 'unibas-msedge-webview2*'
  checksum       = 'b5293900a46e2248cae5b15a3a355715f2958195b7519e47fe73c845f6a4d2c2'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
