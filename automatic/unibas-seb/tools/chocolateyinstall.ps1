$ErrorActionPreference = 'Stop'

$logFile = Join-Path $env:temp "install.log"
  
$packageArgs = @{
  packageName   = 'unibas-seb'
  softwareName  = 'Safe Exam Browser*'
  fileType      = 'EXE'
  silentArgs    = '/quiet /norestart /log $($logFile)'
  validExitCodes= @(0)
  url           = 'https://github.com/SafeExamBrowser/seb-win-refactoring/releases/download/v3.9.0/SEB_3.9.0.787_SetupBundle.exe'
  checksum      = 'b367a8259d18e2045ff5d19ae967709c9f6b41ad10022373a28633239fa87383'
  checksumType  = 'sha256'
}
 
Install-ChocolateyPackage @packageArgs
