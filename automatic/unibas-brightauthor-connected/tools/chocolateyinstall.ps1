$ErrorActionPreference = 'Stop';

$packageName = 'unibas-brightauthor-connected'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName    = $packageName
  unzipLocation  = $toolsDir
  fileType       = 'EXE'
  url            = 'https://www.brightsignnetwork.com/download/ba-connected-builds/ba-connected-prod/BA connected Setup 1.7.11.exe'
  silentArgs     = "/S"
  softwareName   = 'unibas-brightauthor-connected'
  checksum       = '786ca783d4c3759087bdf21222cd74fd2931baad879dede99e9a810ce730a828'
  checksumType   = 'sha256' 
}

Install-ChocolateyPackage @packageArgs
