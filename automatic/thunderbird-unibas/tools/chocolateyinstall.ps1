
$ErrorActionPreference = 'Stop';
 

$packageName= 'thunderbird-unibas'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
 
$packageArgs = @{
  packageName   = $packageName
  unzipLocation = $toolsDir
  fileType      = 'EXE'
  url           = ''
  
  silentArgs   = '/S'
  validExitCodes= @(0) 

  softwareName  = 'Mozilla Thunderbird*'
  checksum      = ''
  checksumType  = 'md5'
}

&(Join-path $PSScriptRoot InitialScript.ps1)
Install-ChocolateyPackage @packageArgs
&(Join-path $PSScriptRoot FinalScript.ps1)
