$ErrorActionPreference = 'Stop';
 
$packageName = 'unibas-dotnetdesktopruntime'
 
$packageArgs = @{
  packageName    = $packageName
  fileType       = 'exe'
  url            = 'https://builds.dotnet.microsoft.com/dotnet/WindowsDesktop/10.0.15/windowsdesktop-runtime-10.0.15-win-x64.exe'
  silentArgs     = '/S'
  validExitCodes = @(0)
 
  softwareName   = 'unibas-dotnetdesktopruntime' 
  checksum       = 'e61b030c1673edfa3c0844502eff83198c46af9e7df70dfc6e2efc5b11ea513a'
  checksumType   = 'sha256'
}
 
Install-ChocolateyPackage @packageArgs
