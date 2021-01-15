$ErrorActionPreference = 'Stop';
 
$packageName= 'rstudio'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
 
$packageArgs = @{
  packageName   = $packageName
  unzipLocation = $toolsDir
  fileType      = 'EXE'
  url           = 'https://download1.rstudio.org/desktop/windows/RStudio-1.4.1103.exe'
  silentArgs   = '/S'
  validExitCodes= @(0)
 
  softwareName  = 'rstudio*'
  checksum      = '3196c9e727ddb4447e3664a2c380860b'
  checksumType  = 'md5'
}

Install-ChocolateyPackage @packageArgs
