$ErrorActionPreference = 'Stop';
 
$packageName = 'unibas-dotnetdesktopruntime'
 
$packageArgs = @{
  packageName    = $packageName
  fileType       = 'exe'
  url            = 'https://download.visualstudio.microsoft.com/download/pr/63f0335a-6012-4017-845f-5d655d56a44f/f8d5150469889387a1de578d45415201/windowsdesktop-runtime-9.0.3-win-x64.exe'
  silentArgs     = '/S'
  validExitCodes = @(0)
 
  softwareName   = 'unibas-dotnetdesktopruntime' 
  checksum       = 'e477efa08fd14d6d543b71dbfca0c5e2f2a1b18dda244d3e6bc0ef548c528c38'
  checksumType   = 'sha256'
}
 
Install-ChocolateyPackage @packageArgs
