$ErrorActionPreference = 'Stop';

$packageName 	= 'paraview'
$url            = 'https://www.paraview.org/paraview-downloads/download.php?submit=Download&version=v6.2/&type=binary&os=Windows&downloadFile=ParaView-6.2.0-Windows-Python3.12-msvc2017-AMD64.msi'
$checksum       = '386f308913d217a558eb8069a811c0037e2d9174385f573ecaa43cd814e29f40'
$checksumType   = 'sha256'

$packageArgs = @{
  packageName    = $packageName
  fileType       = 'MSI'
  url            = $url
  softwareName   = 'paraview*'
  checksum       = $checksum
  checksumType   = $checksumType
  silentArgs    = "/quiet /qn /norestart"
  validExitCodes= @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
