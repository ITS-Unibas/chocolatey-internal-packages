$ErrorActionPreference = 'Stop';
 
$packageName = 'unibas-dotnetdesktopruntime'
 
$packageArgs = @{
  packageName    = $packageName
  fileType       = 'exe'
  url            = 'https://builds.dotnet.microsoft.com/dotnet/WindowsDesktop/9.0.9/windowsdesktop-runtime-9.0.9-win-x64.exe'
  silentArgs     = '/S'
  validExitCodes = @(0)
 
  softwareName   = 'unibas-dotnetdesktopruntime' 
  checksum       = '52d5b789d31999b1b5eaa590faa1649506dd9a406c17daa09681b78ff9da9e68'
  checksumType   = 'sha256'
}
 
Install-ChocolateyPackage @packageArgs
