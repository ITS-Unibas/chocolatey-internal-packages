$ErrorActionPreference = 'Stop';

$packageName 	= 'paraview'
$url            = 'https://www.paraview.org/paraview-downloads/download.php?submit=Download&version=v6.0/&type=binary&os=Windows&downloadFile=ParaView-6.0.1-Windows-Python3.12-msvc2017-AMD64.msi'
$checksum       = '928603549b9be2b787fa2d507e00b7bc84b361bbf5e3c6a15765dd4836d9a2da'
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
