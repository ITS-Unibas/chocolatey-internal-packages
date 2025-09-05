$ErrorActionPreference = 'Stop'

$logFile = Join-Path $env:temp "install.log"
  
$packageArgs = @{
  packageName   = 'unibas-seb'
  softwareName  = 'Safe Exam Browser*'
  fileType      = 'EXE'
  silentArgs    = '/quiet /norestart /log $($logFile)'
  validExitCodes= @(0)
  url           = 'https://github.com/SafeExamBrowser/seb-win-refactoring/releases/download/v3.10.0/SEB_3.10.0.826_SetupBundle.exe'
  checksum      = 'd24336c21718e98b6bd82a8aeb2877f4d84e67dbf5f263df1c704d0127542eee'
  checksumType  = 'sha256'
}
 
Install-ChocolateyPackage @packageArgs
