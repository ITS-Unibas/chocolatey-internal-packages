$ErrorActionPreference = 'Stop'

$logFile = Join-Path $env:temp "install.log"
  
$packageArgs = @{
  packageName   = 'unibas-seb'
  softwareName  = 'Safe Exam Browser*'
  fileType      = 'EXE'
  silentArgs    = '/quiet /norestart /log $($logFile)'
  validExitCodes= @(0)
  url           = 'https://github.com/SafeExamBrowser/seb-win-refactoring/releases/download/v3.10.1/SEB_3.10.1.864_SetupBundle.exe'
  checksum      = '04ce06ef92444813f0286f5a0a98333f24a6998b777ae295bb5077ca5f4ad9bb'
  checksumType  = 'sha256'
}
 
Install-ChocolateyPackage @packageArgs
