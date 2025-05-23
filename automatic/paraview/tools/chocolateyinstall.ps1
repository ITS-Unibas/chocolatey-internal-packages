$ErrorActionPreference = 'Stop';

$packageName 	= 'paraview'
$url            = 'https://www.paraview.org/paraview-downloads/download.php?submit=Download&version=v6.0/&type=binary&os=Windows&downloadFile=ParaView-6.0.0-RC1-Windows-Python3.12-msvc2017-AMD64.msi'
$checksum       = '606d762a20b636693b047e4cd064d58ceb82ee42460de7ac40f717eb0f50b52d'
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
