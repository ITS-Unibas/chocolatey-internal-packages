$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'unibas-visioviewer2016'
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType       = 'exe'
  url            = 'https://download.microsoft.com/download/D/B/7/DB790874-4414-417F-ADF6-348B29572B9F/visioviewer_4339-1001_x64_en-us.exe'
  silentArgs     = '/quiet /passive /norestart'
  validExitCodes = @(0, 1638, 3010)
  softwareName   = 'Microsoft Visio Viewer'
  checksum       = 'b8ff91c1d37284ef4ec8380045a48e915cfe75536c700d5a8bbe229f1f1fafa1'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
