$ErrorActionPreference = 'Stop';
 
$packageName= 'rstudio'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
 
$packageArgs = @{
  packageName   = $packageName
  unzipLocation = $toolsDir
  fileType      = 'EXE'
  url           = 'https://download1.rstudio.org/desktop/windows/RStudio-2022.02.0-443.exe'
  silentArgs   = '/S'
  validExitCodes= @(0)
 
  softwareName  = 'rstudio*'
  checksum      = 'e308f15d8852df5c8ad4c261660b74b0'
  checksumType  = 'md5'
}

Install-ChocolateyPackage @packageArgs
