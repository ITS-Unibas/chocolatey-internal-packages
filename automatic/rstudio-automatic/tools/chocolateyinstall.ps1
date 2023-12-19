$ErrorActionPreference = 'Stop';
 
$packageName= 'rstudio'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
 
$packageArgs = @{
  packageName   = $packageName
  unzipLocation = $toolsDir
  fileType      = 'EXE'
  url           = 'https://download1.rstudio.org/electron/windows/RStudio-2023.12.0-369.exe'
  silentArgs   = '/S'
  validExitCodes= @(0)
 
  softwareName  = 'rstudio*'
  checksum      = '3acb7c398845b83edbadad24052ada80'
  checksumType  = 'md5'
}

Install-ChocolateyPackage @packageArgs
