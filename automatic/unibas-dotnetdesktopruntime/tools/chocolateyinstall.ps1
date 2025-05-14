$ErrorActionPreference = 'Stop';
 
$packageName = 'unibas-dotnetdesktopruntime'
 
$packageArgs = @{
  packageName    = $packageName
  fileType       = 'exe'
  url            = 'https://builds.dotnet.microsoft.com/dotnet/WindowsDesktop/9.0.5/windowsdesktop-runtime-9.0.5-win-x64.exe'
  silentArgs     = '/S'
  validExitCodes = @(0)
 
  softwareName   = 'unibas-dotnetdesktopruntime' 
  checksum       = 'a9620b3bf29c8ef2b4c18051589bd24e0c2437eaec4e677f54d67fdd0f3a38bc'
  checksumType   = 'sha256'
}
 
Install-ChocolateyPackage @packageArgs
