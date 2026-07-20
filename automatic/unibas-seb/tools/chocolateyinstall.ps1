$ErrorActionPreference = 'Stop'

$logFile = Join-Path $env:temp "install.log"
  
$packageArgs = @{
  packageName   = 'unibas-seb'
  softwareName  = 'Safe Exam Browser*'
  fileType      = 'EXE'
  silentArgs    = '/quiet /norestart /log $($logFile)'
  validExitCodes= @(0)
  url           = 'https://github.com/SafeExamBrowser/seb-win-refactoring/releases/download/v3.10.2/SEB_3.10.2.920_SetupBundle.exe'
  checksum      = '45e463ff49dcc39d6bb48cde3749ab7fa31d502f7dd271e9a86b04a8948893f9'
  checksumType  = 'sha256'
}
 
Install-ChocolateyPackage @packageArgs
