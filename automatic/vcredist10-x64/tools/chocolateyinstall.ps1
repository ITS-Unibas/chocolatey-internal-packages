﻿$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'vcredist10-x64'
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType       = 'exe'
  url            = 'https://download.microsoft.com/download/3/2/2/3224B87F-CFA0-4E70-BDA3-3DE650EFEBA5/vcredist_x64.exe'
  silentArgs     = '/quiet /norestart'
  validExitCodes = @(0, 1638, 3010)
  softwareName   = 'Microsoft Visual C++ 2010 Redistributable (x64)*'
  checksum       = 'b06546ddc8ca1e3d532f3f2593e88a6f49e81b66a9c2051d58508cc97b6a2023'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
