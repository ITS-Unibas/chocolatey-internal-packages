$ErrorActionPreference = 'Stop';

$packageName = 'unibas-jabref'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName    = $packageName
  unzipLocation  = $toolsDir
  fileType       = 'MSI'
  url64bit       = 'https://github.com/JabRef/jabref/releases/download/v5.13/JabRef-5.13.msi'
  silentArgs     = "/quiet /qn /norestart"
  validExitCodes = @(0, 3010, 1641)
  softwareName   = 'unibas-jabref*'
  checksum64     = 'b07d8288f703458c971c9e9c70f8a5d3cddb463911eb8307d79b710ffa165e90'
  checksumType64 = 'sha256' #default is checksumType
}

Install-ChocolateyPackage @packageArgs
