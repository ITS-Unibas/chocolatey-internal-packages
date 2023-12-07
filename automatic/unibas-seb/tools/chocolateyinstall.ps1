$ErrorActionPreference = 'Stop'

$logFile = Join-Path $env:temp "install.log"
  
$packageArgs = @{
  packageName   = 'unibas-seb'
  softwareName  = 'Safe Exam Browser*'
  fileType      = 'EXE'
  silentArgs    = '/quiet /norestart /log $($logFile)'
  validExitCodes= @(0)
  url           = 'https://github.com/SafeExamBrowser/seb-win-refactoring/releases/download/v3.6.0/SEB_3.6.0.633_SetupBundle.exe'
  checksum      = 'b65740b154016e5875f280bda7d59de0fa50ee4b29cd719d23925c7c24999f24'
  checksumType  = 'sha256'
}
 
Install-ChocolateyPackage @packageArgs
