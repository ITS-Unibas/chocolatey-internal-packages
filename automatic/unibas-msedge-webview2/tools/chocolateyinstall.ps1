$ErrorActionPreference = 'Stop';

$packageName = 'unibas-msedge-webview2'

$packageArgs = @{
  packageName    = $packageName
  fileType       = 'EXE'
  url            = 'https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/913236b0-52e1-4dde-943c-2cfdbe153d31/MicrosoftEdgeWebView2RuntimeInstallerX64.exe'
  silentArgs     = "/silent /install"
  validExitCodes = @(0)
  softwareName   = 'unibas-msedge-webview2*'
  checksum       = 'ad9b350625e132481bc0953eee9e032810134df9fedbd7be364c3f4e0e4dbd64'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
