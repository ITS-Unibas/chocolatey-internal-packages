$ErrorActionPreference = 'Stop';
 
$packageName= 'rstudio'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
 
$packageArgs = @{
  packageName   = $packageName
  unzipLocation = $toolsDir
  fileType      = 'EXE'
  url           = 'https://download1.rstudio.org/electron/windows/RStudio-2026.01.1-403.exe'
  silentArgs   = '/S'
  validExitCodes= @(0)
 
  softwareName  = 'rstudio*'
  checksum      = 'd6c329d6a89fdc822813fbf6eefc4b6e'
  checksumType  = 'md5'
}

Install-ChocolateyPackage @packageArgs
