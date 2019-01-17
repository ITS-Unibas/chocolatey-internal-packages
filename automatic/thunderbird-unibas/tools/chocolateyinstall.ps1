$ErrorActionPreference = 'Stop';
 

$packageName= 'thunderbird-unibas'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
 
$packageArgs = @{
  packageName   = $packageName
  unzipLocation = $toolsDir
  fileType      = 'EXE'
  url           = 'https://download.mozilla.org/?product=thunderbird-60.4.0-SSL&os=win&lang=de'
  
  silentArgs   = '/S'
  validExitCodes= @(0) 

  softwareName  = 'Mozilla Thunderbird*'
  checksum      = 'adbc92ed04bea3d80d8d588fec422f6f'
  checksumType  = 'md5'
}

Install-ChocolateyPackage @packageArgs
