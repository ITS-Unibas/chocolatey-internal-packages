$ErrorActionPreference = 'Stop';

$packageName = 'unibas-jabref'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName    = $packageName
  unzipLocation  = $toolsDir
  fileType       = 'MSI'
  url64bit       = 'https://github.com//JabRef/jabref/releases/download/v5.6/JabRef-5.6.msi'
  silentArgs     = "/quiet /qn /norestart"
  validExitCodes = @(0, 3010, 1641)
  softwareName   = 'unibas-jabref*'
  checksum64     = 'ce1c0231aa8aa50bd7167658aa084903e57ea7fcfa9811ce92cc68b9e20d7a38'
  checksumType64 = 'sha256' #default is checksumType
}

Install-ChocolateyPackage @packageArgs
