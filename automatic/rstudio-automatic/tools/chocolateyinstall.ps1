$ErrorActionPreference = 'Stop';
 
$packageName= 'rstudio'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
 
$packageArgs = @{
  packageName   = $packageName
  unzipLocation = $toolsDir
  fileType      = 'EXE'
  url           = 'https://download1.rstudio.org/desktop/windows/RStudio-2022.02.1-461.exe'
  silentArgs   = '/S'
  validExitCodes= @(0)
 
  softwareName  = 'rstudio*'
  checksum      = '591dfa70c5679e35da394e3344367343'
  checksumType  = 'md5'
}

Install-ChocolateyPackage @packageArgs
