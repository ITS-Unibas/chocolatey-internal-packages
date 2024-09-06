﻿$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'msedge'
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType       = 'msi'
  url            = 'https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/d2ab6a99-2aa3-4baa-9536-4aaf9a1e1750/MicrosoftEdgeEnterpriseX64.msi'
  silentArgs     = '/quiet /norestart'
  validExitCodes = @(0)
  softwareName   = 'edge*'
  checksum       = '76A2ACC003B7EA0A8BA3525359D4ADCC5BACEC40B098EE6212238A97521BC093'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
