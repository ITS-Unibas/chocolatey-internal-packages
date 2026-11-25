$ErrorActionPreference = 'Stop';
 
$packageName= 'rstudio'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
 
$packageArgs = @{
  packageName   = $packageName
  unzipLocation = $toolsDir
  fileType      = 'EXE'
  url           = 'https://download1.rstudio.org/electron/windows/RStudio-2026.11.1-204.exe'
  silentArgs   = '/S'
  validExitCodes= @(0)
 
  softwareName  = 'rstudio*'
  checksum      = '0f3f7b6b20313a5f97b0ecaaa796ca0aeee4db128bab2170218ff2b23c7b2423'
  checksumType  = 'sha256'
}

Install-ChocolateyPackage @packageArgs
