$ErrorActionPreference = 'Stop'

$logFile = Join-Path $env:temp "install.log"
  
$packageArgs = @{
  packageName   = 'unibas-seb'
  softwareName  = 'Safe Exam Browser*'
  fileType      = 'EXE'
  silentArgs    = '/quiet /norestart /log $($logFile)'
  validExitCodes= @(0)
  url           = 'https://github.com/SafeExamBrowser/seb-win-refactoring/releases/download/v3.10.2/SEB_3.10.2.904_SetupBundle.exe'
  checksum      = '9180566e407555fd8be9f7a022aa35a595e629ed9c9f81daf2cdd65ddb9646b6'
  checksumType  = 'sha256'
}
 
Install-ChocolateyPackage @packageArgs
