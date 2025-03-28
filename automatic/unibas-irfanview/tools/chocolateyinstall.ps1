$ErrorActionPreference = 'Stop'; # stop on all errors


$packageName= 'unibas-irfanview' # arbitrary name for the package, used in messages
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = '$url64' # download url

$packageArgs = @{
  packageName   = $packageName
  unzipLocation = $toolsDir
  fileType      = 'exe' #only one of these: exe, msi, msu
  url           = $url
  file         =  ''
  silentArgs    = "/silent /group=1 /allusers=1"
  validExitCodes= @(0)
    softwareName  = 'irfanview*' #part or all of the Display Name as you see it in Programs and Features. It should be enough to be unique
  checksum      = ''
  checksumType  = 'sha256' #default is md5, can also be sha1
}

Install-ChocolateyPackage @packageArgs
