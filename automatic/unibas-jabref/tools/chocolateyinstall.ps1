$ErrorActionPreference = 'Stop';

$packageName = 'unibas-jabref'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName    = $packageName
  unzipLocation  = $toolsDir
  fileType       = 'MSI'
  url64bit       = 'https://github.com//JabRef/jabref/releases/download/v5.2/JabRef-5.2.msi'
  silentArgs     = "/quiet /qn /norestart"
  validExitCodes = @(0, 3010, 1641)
  softwareName   = 'unibas-jabref*'
  checksum64     = 'f3523a0c82473b79fc1021ed4b5d444018a5150771ffa579d3d4faaaf2aa66d0'
  checksumType64 = 'sha256' #default is checksumType
}

Install-ChocolateyPackage @packageArgs
