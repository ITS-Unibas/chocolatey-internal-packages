$ErrorActionPreference = 'Stop'

$logFile = Join-Path $env:temp "install.log"
  
$packageArgs = @{
  packageName   = 'unibas-seb'
  softwareName  = 'Safe Exam Browser*'
  fileType      = 'EXE'
  silentArgs    = '/quiet /norestart /log $($logFile)'
  validExitCodes= @(0)
  url           = 'https://github.com/SafeExamBrowser/seb-win-refactoring/releases/download/v3.8.0/SEB_3.8.0.742_SetupBundle.exe'
  checksum      = '24903952ce7d22661c3d7e94b2b78a90dfc954eea59ba4e9b4bea1633917f54e'
  checksumType  = 'sha256'
}
 
Install-ChocolateyPackage @packageArgs
