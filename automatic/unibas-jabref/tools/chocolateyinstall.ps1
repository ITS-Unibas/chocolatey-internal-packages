$ErrorActionPreference = 'Stop';

$packageName = 'unibas-jabref'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName    = $packageName
  unzipLocation  = $toolsDir
  fileType       = 'MSI'
  url64bit       = 'https://github.com/JabRef/jabref/releases/download/v6.0-alpha/JabRef-6.0.msi'
  silentArgs     = "/quiet /qn /norestart"
  validExitCodes = @(0, 3010, 1641)
  softwareName   = 'unibas-jabref*'
  checksum64     = '5a89a104c3d472197144e8cc3494c85b282e40b902b525177f82a89b67738a7a'
  checksumType64 = 'sha256' #default is checksumType
}

Install-ChocolateyPackage @packageArgs
