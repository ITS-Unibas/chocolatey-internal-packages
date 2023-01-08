$ErrorActionPreference = 'Stop';

$packageName = 'unibas-jabref'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName    = $packageName
  unzipLocation  = $toolsDir
  fileType       = 'MSI'
  url64bit       = 'https://github.com/JabRef/jabref/releases/download/v5.9/JabRef-5.9.msi'
  silentArgs     = "/quiet /qn /norestart"
  validExitCodes = @(0, 3010, 1641)
  softwareName   = 'unibas-jabref*'
  checksum64     = '7c03092b5c9aa3e7da7f6e04895a1dbfd48c6bd88790ced13ac728b8e6c88cb7'
  checksumType64 = 'sha256' #default is checksumType
}

Install-ChocolateyPackage @packageArgs
