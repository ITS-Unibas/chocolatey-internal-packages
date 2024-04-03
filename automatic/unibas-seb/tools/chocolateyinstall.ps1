$ErrorActionPreference = 'Stop'

$logFile = Join-Path $env:temp "install.log"
  
$packageArgs = @{
  packageName   = 'unibas-seb'
  softwareName  = 'Safe Exam Browser*'
  fileType      = 'EXE'
  silentArgs    = '/quiet /norestart /log $($logFile)'
  validExitCodes= @(0)
  url           = 'https://github.com/SafeExamBrowser/seb-win-refactoring/releases/download/v3.7.0/SEB_3.7.0.682_SetupBundle.exe'
  checksum      = 'b4b4f2bff48f5cdb9c33b4b81d2607b7a0f0355726e9f9bd8070653c1f178b52'
  checksumType  = 'sha256'
}
 
Install-ChocolateyPackage @packageArgs
