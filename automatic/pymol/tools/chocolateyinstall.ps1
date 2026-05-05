$ErrorActionPreference = 'Stop';

$packageName = 'pymol'
$url = ''

$packageArgs = @{
  packageName    = $packageName
  url            = $url
  softwareName   = 'PyMOL*'
  fileType       = 'exe'
  checksum       = ''
  checksumType   = 'sha256' 
  silentArgs     = "/S /InstallationType=AllUsers"
}

Install-ChocolateyPackage @packageArgs
