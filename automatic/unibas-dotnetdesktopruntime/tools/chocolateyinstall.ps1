$ErrorActionPreference = 'Stop';
 
$packageName = 'unibas-dotnetdesktopruntime'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$LogPath = "$env:SWP\"
 
$packageArgs = @{
  packageName    = $packageName
  unzipLocation  = $toolsDir
  fileType       = 'exe'
  url            = 'https://download.visualstudio.microsoft.com/download/pr/0c804185-7f86-4167-8703-8365d4939d72/02935dd20c741d36acb2c4eb2f2d5a21/windowsdesktop-runtime-9.0.0-preview.1.24081.3-win-x64.exe'
  silentArgs     = '/S'
  validExitCodes = @(0)
 
  # optional, highly recommended
  softwareName   = 'unibas-dotnetdesktopruntime' 
  checksum       = 'a1f4fabe710c4edb012ca6578e4c3ccfed49e4af12c0f5dbb7b50b2f1c69cbf1'
  checksumType   = 'sha256'
}
 
Install-ChocolateyPackage @packageArgs
