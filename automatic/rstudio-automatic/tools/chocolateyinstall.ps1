$ErrorActionPreference = 'Stop';
 
$packageName= 'rstudio'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
 
$packageArgs = @{
  packageName   = $packageName
  unzipLocation = $toolsDir
  fileType      = 'EXE'
  url           = 'https://download1.rstudio.org/electron/windows/RStudio-2026.01.2-418.exe'
  silentArgs   = '/S'
  validExitCodes= @(0)
 
  softwareName  = 'rstudio*'
  checksum      = '7cf2c07079ebdac14097ca25ef9f7e8243b07e7b0b3ecc82d8549e7ec95a8c4f'
  checksumType  = 'sha256'
}

Install-ChocolateyPackage @packageArgs
