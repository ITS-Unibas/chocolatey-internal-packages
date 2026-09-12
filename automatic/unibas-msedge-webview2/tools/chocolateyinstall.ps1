$ErrorActionPreference = 'Stop';

$packageName = 'unibas-msedge-webview2'

$packageArgs = @{
  packageName    = $packageName
  fileType       = 'EXE'
  url            = 'https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/5bdafa0b-8f06-4cab-b664-252bfeca6c75/MicrosoftEdgeWebView2RuntimeInstallerX64.exe'
  silentArgs     = "/silent /install"
  validExitCodes = @(0)
  softwareName   = 'unibas-msedge-webview2*'
  checksum       = 'ebebc5ec130378ff1ab513f3917be791a9cf84f849e970b1695ff01801a9d348'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
