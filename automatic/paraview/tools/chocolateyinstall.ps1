$ErrorActionPreference = 'Stop';

$packageName 	= 'paraview'
$url            = 'https://www.paraview.org/paraview-downloads/download.php?submit=Download&version=v5.13/&type=binary&os=Windows&downloadFile=ParaView-5.13.0-RC1-Windows-Python3.10-msvc2017-AMD64.msi'
$checksum       = 'e5ace095b3bde573cea97cc61301399f4e53ccf57c388d2a05735b6c742a2ace'
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
