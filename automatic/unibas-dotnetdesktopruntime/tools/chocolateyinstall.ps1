$ErrorActionPreference = 'Stop';
 
$packageName = 'unibas-dotnetdesktopruntime'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$LogPath = "$env:SWP\"
 
$packageArgs = @{
  packageName    = $packageName
  unzipLocation  = $toolsDir
  fileType       = 'exe'
  url            = 'https://download.visualstudio.microsoft.com/download/pr/76e5dbb2-6ae3-4629-9a84-527f8feb709c/09002599b32d5d01dc3aa5dcdffcc984/windowsdesktop-runtime-8.0.6-win-x64.exe'
  silentArgs     = '/S'
  validExitCodes = @(0)
 
  # optional, highly recommended
  softwareName   = 'unibas-dotnetdesktopruntime' 
  checksum       = '6ca28cc70a9d85ac8ec0cf1faaefdcda045af0d1d46acd66e28a6d1863dfe026'
  checksumType   = 'sha256'
}
 
Install-ChocolateyPackage @packageArgs
