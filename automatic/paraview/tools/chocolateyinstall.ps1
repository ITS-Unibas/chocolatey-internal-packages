$ErrorActionPreference = 'Stop';

$packageName 	= 'paraview'
$url            = 'https://www.paraview.org/paraview-downloads/download.php?submit=Download&version=v6.2/&type=binary&os=Windows&downloadFile=ParaView-6.2.1-Windows-Python3.12-msvc2017-AMD64.msi'
$checksum       = 'a54fa547fb21f2c2a8f079de19b4e5520e1e0d0299f58150731eed355d50b823'
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
