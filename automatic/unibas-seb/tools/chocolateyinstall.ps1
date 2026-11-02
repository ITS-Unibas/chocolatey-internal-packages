$ErrorActionPreference = 'Stop'

$logFile = Join-Path $env:temp "install.log"
  
$packageArgs = @{
  packageName   = 'unibas-seb'
  softwareName  = 'Safe Exam Browser*'
  fileType      = 'EXE'
  silentArgs    = '/quiet /norestart /log $($logFile)'
  validExitCodes= @(0)
  url           = 'https://github.com/SafeExamBrowser/seb-win-refactoring/releases/download/v3.10.3/SEB_3.10.3.960_SetupBundle.exe'
  checksum      = '716b25f77ada22bffdd223e147c3f21042d130c006347e35bd9be2c91e51730b'
  checksumType  = 'sha256'
}
 
Install-ChocolateyPackage @packageArgs
