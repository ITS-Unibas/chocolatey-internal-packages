$ErrorActionPreference = 'Stop';
 
$packageName= 'rstudio'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
 
$packageArgs = @{
  packageName   = $packageName
  unzipLocation = $toolsDir
  fileType      = 'EXE'
  url           = 'https://download1.rstudio.org/electron/windows/RStudio-2026.08.1-195.exe'
  silentArgs   = '/S'
  validExitCodes= @(0)
 
  softwareName  = 'rstudio*'
  checksum      = 'b867e71732ca89c5fe5de8b3f6a1b038e2a8545e4a8083c381fb12362fc81480'
  checksumType  = 'sha256'
}

Install-ChocolateyPackage @packageArgs
