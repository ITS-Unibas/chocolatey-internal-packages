$ErrorActionPreference = 'Stop'

$logFile = Join-Path $env:temp "install.log"
  
$packageArgs = @{
  packageName   = 'unibas-seb'
  softwareName  = 'Safe Exam Browser*'
  fileType      = 'EXE'
  silentArgs    = '/quiet /norestart /log $($logFile)'
  validExitCodes= @(0)
  url           = 'https://github.com/SafeExamBrowser/seb-win-refactoring/releases/download/v3.5.0/SEB_3.5.0.544_SetupBundle.exe'
  checksum      = '577f786eea91eb56b61c32879001c61fb28b252ff70bf92b1b43206029b8b13e'
  checksumType  = 'sha256'
}
 
Install-ChocolateyPackage @packageArgs
