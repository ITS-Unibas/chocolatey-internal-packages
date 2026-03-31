$ErrorActionPreference = 'Stop';

$packageName 	= 'paraview'
$url            = 'https://www.paraview.org/paraview-downloads/download.php?submit=Download&version=v6.1/&type=binary&os=Windows&downloadFile=ParaView-6.1.0-Windows-Python3.12-msvc2017-AMD64.msi'
$checksum       = 'ccd582f55079413659d67ac0c76cb9a0778dc5dca8fbd365e9a42775f48c420e'
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
