$ErrorActionPreference = 'Stop';

$packageName 	= 'paraview'
$url            = 'https://www.paraview.org/paraview-downloads/download.php?submit=Download&version=v5.12/&type=binary&os=Windows&downloadFile=ParaView-5.12.0-Windows-Python3.10-msvc2017-AMD64.msi'
$checksum       = '7fd0936a38cb62db888197e8cb740ab3f01c03f6324d5a0ecb3114e6adcdb40a'
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
