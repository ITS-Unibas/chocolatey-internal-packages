$ErrorActionPreference = 'Stop';

$packageName 	= 'paraview'
$url            = 'https://www.paraview.org/paraview-downloads/download.php?submit=Download&version=v6.1/&type=binary&os=Windows&downloadFile=ParaView-6.1.0-RC1-Windows-Python3.12-msvc2017-AMD64.msi'
$checksum       = '5dc380ecdccf627d3bdb0a65bcac7348de12fa37f75c20e109358bf815bdc913'
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
