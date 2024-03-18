$ErrorActionPreference = 'Stop';
 
$packageName = 'unibas-dotnetdesktopruntime'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$LogPath = "$env:SWP\"
 
$packageArgs = @{
  packageName    = $packageName
  unzipLocation  = $toolsDir
  fileType       = 'exe'
  url            = 'https://download.visualstudio.microsoft.com/download/pr/9e753d68-7701-4ddf-b358-79d64e776945/2a58564c6d0779a7b443a692c520782f/dotnet-sdk-8.0.203-win-x64.exe'
  silentArgs     = '/S'
  validExitCodes = @(0)
 
  # optional, highly recommended
  softwareName   = 'unibas-dotnetdesktopruntime' 
  checksum       = '1d691580c6639dc96a4c8908dfecf9e3ca000201a5cd9e2e56541bbd14b8f5c9'
  checksumType   = 'sha256'
}
 
Install-ChocolateyPackage @packageArgs
