$ErrorActionPreference = 'Stop';
 
$packageName = 'unibas-dotnetdesktopruntime'
 
$packageArgs = @{
  packageName    = $packageName
  fileType       = 'exe'
  url            = 'https://builds.dotnet.microsoft.com/dotnet/WindowsDesktop/10.0.7/windowsdesktop-runtime-10.0.7-win-x64.exe'
  silentArgs     = '/S'
  validExitCodes = @(0)
 
  softwareName   = 'unibas-dotnetdesktopruntime' 
  checksum       = '752b7c81f6b10cacbe133a18a8af8d2598336e9561e651711eb3b36970299854'
  checksumType   = 'sha256'
}
 
Install-ChocolateyPackage @packageArgs
