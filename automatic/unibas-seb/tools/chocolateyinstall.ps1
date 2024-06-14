$ErrorActionPreference = 'Stop'

$logFile = Join-Path $env:temp "install.log"
  
$packageArgs = @{
  packageName   = 'unibas-seb'
  softwareName  = 'Safe Exam Browser*'
  fileType      = 'EXE'
  silentArgs    = '/quiet /norestart /log $($logFile)'
  validExitCodes= @(0)
  url           = 'https://github.com/SafeExamBrowser/seb-win-refactoring/releases/download/v3.7.1/SEB_3.7.1.704_SetupBundle.exe'
  checksum      = 'bed0d15eb12d8bf3de8cfa92f95102afb867b83def4a9cdc57acff8b8626d909'
  checksumType  = 'sha256'
}
 
Install-ChocolateyPackage @packageArgs
